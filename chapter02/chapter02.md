# iOS 앱의 구조와 코코아 터치 프레임워크

### 2.1.1 엔트리 포인트와 앱의 초기화 과정

UIApplicationMain() 함수는 그 중에서도 iOS 앱에 속하는 부분은 엔트리 포인트이다. 앱의 핵심객체를 생성하는 프로세스를 핸들링하고, 스토리보드 파일로부터 앱의 유저 인터페이스를 읽어 들일뿐만 아니라 우리가 작성한 커스텀 코드를 호출해줌으로써 앱 생성 초기에 필요한 설정을 구현할 수 있게 해준다. 여기에 더해서 이벤트를 입력받기 위한 이벤트 루프를 실행시키기도 한다. 

UIApplication 객체의 역할은 매우 다양하다. 이벤트 루프나 다른 높은 수준의 앱 동작을 관리할 뿐만 아니라 푸시 알림과 같은 특수한 이벤트를 우리가 정의한 커스텀 객체인 델리게이트에게 알려주기도 한다. 

AppDelegate 는 UIApplication으로부터 위임받은 일부 권한을 이용하여 커스텀 코드와 상호작용하는 역할을 담당하고, 이를 통해 우리가 필요한 코드를 구현할 수 있도록 도와준다.

UIApplication 객체와 AppDelegate 객체가 연관되어 앱이 실행되는 전체 과정이다.

main() 실행 -> main() 는 UIApplicationMain() 을 호출한다 -> UIApplicationMain() 은 앱의 본체에 해당하는 UIApplication 객체를 생성 -> UIApplication 객체는 Info.plist 파일을 바탕으로 앱에 필요한 데이터과 객체를 로드 -> AppDelegate 객체를 생성하고 UIApplication 객체와 연결 -> 이벤트 루프를 만드는 등 실행에 필요한 준비를 진행 -> 실행 완료 직전, 앱 델리게이트의 application(didFinishLaunchingWithOptions:) 메소드 호출

스위프트에서는 직접 main() 을 호출하여 델리케이트 클래스를 인자값으로 전달할 수 없으므로 대신 앱 델리게이트 역할을 할 클래스에 @main 어노테이션을 걸어 표시하는 방법으로 시스템에 델리게이트 클래스 정보를 전달한다. 

앱이 실행 목적을 모두 완료하고 더 이상 사용되지 않으면 시스템은 앱을 메모리에서 제거하기 준비를 한다. 이 과정에서 앱 시스템은 델리게이트 클래스의 applicationWillTerminate() 메소드를 호출한다. 

 ### 2.1.2 MVC 패턴
 
 MVC 패턴이란, 소스 코드 설계 기법으로써 Model-View-Controller 이어지는 세 개의 핵심 구조를 이용하여 애플리케이션을 설계하는 것을 말한다. 모델은 데이터를 담당, 뷰는 데이터에 대한 화면 표현을 담당, 컨트롤러는 모델과 뷰 사이에 위치하여 데이터를 가공하여 뷰로 전달하고 뷰에서 발생하는 이벤트를 입력받아 처리하는 역할.
 
 이 패턴을 따르면 데이터 관리 부분을 수정해도 비즈니스로직이나 화면 표현 코드에는 영향을 미치지 않고, 화면을 표현하는 코드를 수정하더라도 비즈니스 로직이나 데이터 관리 부분에 영향을 미치지 않으므로 훨씬 더 프로그램이 유연해지는 결과를 얻을 수 있다.
 
 ### 2.1.3 앱의 상태 변화
 
아래에는 iOS 앱의 라이프 사이클(=생명주기) 라고 한다. 어떤 특정한 순간에 앱의 위의 상태 중 어느 하나 일수도 있고, 하나의 상태에서 다른 상태로 옮겨가는 중일 수 있다.

Not Running : 앱이 시작되지 않았거나 실행되었지만 시스템에 의해 종료된 상태를 나타낸다.  
Inactive : 앱이 전면에서 실행중이지만, 아무런 이벤트를 받지 않고 있는 상태.  
Active : 앱이 전면에서 실행중이며, 이벤트를 받고 있는 상태를 나타냄.  
Background : 앱이 백그라운드에 있지만 여전히 코드가 실행되고 있는 상태를 나타냅니다. 대부분의 Suspended 상태로 이행하는 도중에 일시적으로 이 상태에 진입하지만, 파일 다운로드나 업로드, 연산 처리 등 여분의 실행 시간이 필요한 앱일 경우 특정 시간 동안 이 상태로 남아 있게 되는 경우도 있다.  
Suspended : 앱이 메모리에 유지되지만 실행되는 코드가 없는 상태이다. 메모리가 부족한 상황이 오면 iOS 시스템은 포그라운드에 있는 앱의 여유 메모리 공간을 확보하기 위해 Suspended 상태에 있는 앱들을 특별한 알림 없이 정리한다. 

앱 델리게이트 객체에는 다양한 메소드들이 정의되어 있으며, 각 메소드들은 모드 그에 맞는 상태 변화에 따라 호출된다. 다음은 주요 메소드들이다.

    application(_: willFinishLaunchingWithOptions:) : 앱이 구동되어 필요한 초기 실행 과정이 완료되기 직전에 호출되는 메소드 
    application(_: didFinishLaunchingWithOptions:) : 앱이 사용자에게 화면으로 표시되기 직전에 호출되는 메소드. 앱이 실행된 후에 진행할 커스터마이징이나 초기화를 위한 코드를 여기에 작성 
    applicationDidBecomeActive(_:) : 실행된 앱이 포그라운드, 즉 화면 전면에 표시될 때 호출되는 메소드이다. 앱이 Inactive 상태에 들어가면서 일시 중지된 작업이 있다면 이를 재시작하는 코드를 여기에 작성해 주어야 한다.  
    applicationDidEnterBackground(_:) : 앱이 백그라운드 상태에 진입했을 때 호출된다. 이 메소드가 호출된다는 것은 미래의 어느 순간에 앱이 종료된다는 의미로, 잃어서는 안 되는 사용자 데이터를 종료 전에 미리 저장하거나, 공유 자원을 점유하고 있었다면 이를 해제해주어야 한다. 종료된 앱이 다시 실행될 때 현재의 상태를 복구할 수 있도록 필요한 상태 정보도 이 메소드에서 저장 처리하는 것이 좋다. 
    applicationWillTerminate(_:) : 앱이 종료되기 직전에 호출되는 메소드. 사용자 데이터 등을 종료되기 전에 한 번 더 저장해두는 것이 좋다.

### 2.2 iOS와 코코아 터치 프레임워크

하나의 앱을 만들기 위해 필요한 프레임워크는 UIKit 만이 아니다. 앱을 만들고 실행할 때 필요한 iOS 기반 기술들은 모두 코코아 터치 프레임워크를 통해 구현되기 때문에, 앱을 제작하기 위해서는 결국 코코아 터치 프레임워크 전체를 이해해야 한다.

### 2.2.1 iOS

네이티브 앱은 iOS 시스템 프레임워크를 기반으로 하고 스위프트 언어로 개발되며 iOS 를 통해 직접 실행되는 앱을 말한다. 비교되는 개념으로 웹 앱이 있다. 

### 2.2.2 코코아 터치 프레임워크

코코아 터치 프레임워크는 애플 환경에서 터치 기반의 애플리케이션을 제작하기 위한 도구모음이다. 다음은 코코아 터치 프레임워크를 이루는 주요 프레임워크이다.

    Foundation : 애플리케이션의 핵심 개체와 네트워크, 문자열 처리 등의 서비스를 제공하는 프레임워크
    UIKit : 아이폰이나, 아이패드, 애플워치나 애플TV 등에서 실행되는 애플리케이션의 UI를 제공하는 프레임워크
    iAd : 앱 내의 배너 형태 또는 팝업 형태의 광고를 삽입할 수 있도록 해 주는 광고 관련 프레임워크
    MapKit : 위치 정보나 지도 관련 서비스를 이용할 수 있도록 해주는 프레임워크
    Address Book UI : 번들 애플리케이션으로 제공되는 주소록 앱의 인터페이스와 기능을 커스텀 앱 내에서도 그대로 사용할 수 있도록 해주는 프레임워크
    EventKit UI : 이벤트 처리에 필요한 UI 를 제공하는 프레임워크
    Message UI : 이벤트 처리에 필요한 유저 인터페이스를 제공하는 프레임워크
    UserNotifications : 사용자 알림을 처리하기 위해 필요한 객체들을 제공하는 프레임워크
    WebKit : 웹 관련 기능을 구현하기 위해 필요한 객체들을 제공하는 프레임워크
    
파운데이션 프레임워크는 기본 데이터 형식, 컬렉션 및 앱의 기본 객체와 기반 기술을 제공하는 역할을 하며, UIKit 프레임워크는 UI 도구를 통해 iOS 앱을 구현할 수 있는 방법을 제공한다. 쉽게 생각해서 iOS 앱으로서의 특징적인 부분은 UIKit 프레임워크가, 내부적으로 돌아가는 기능은 Foundation 프레임워크가 처리한다고 보면 된다. 

Cocoa : Foundation + AppKit / Cocoa Touch : Foundation + UIKit 

대부분의 경우 상위 프레임워크는 하위 프레임워크에 의존적이다. 상위 프레임워크에서 필요한 기능을 모두 직접 구현하는 것이 아니라, 하위 프레임워크를 통해 구현된 기능에 보다 구체적인 기능만 덧붙여 내놓은 식이다. 

### 2.3.1 iOS UI의 표현 구조

윈도우는 iOS에서 디바이스의 스크린을 빈틈없이 채우기 위한 객체로, 항상 UI 표현 계층의 최상위에 위치합니다. 뷰의 일종이지만 직접 콘텐츠를 가지지는 않으며 콘텐츠를 가진 뷰를 내부에 배치하여 화면에 출력하는 역할을 한다. 화면이 전환되더라도 윈도우 객체는 전환되지 않으며 단지 내부에 배치된 뷰의 콘텐츠만 변경된다. 

뷰는 콘텐츠를 담아 이를 스크린상에 표시하고, 사용자의 입력에 반응한다. 윈도우의 일부를 자신의 영역으로 정의하고, 여기에 필요한 콘텐츠를 채워 넣어 스크린에 나타내는 동시에, 윈도우로부터 전달된 사용자의 입력에 반응하여 그에 맞는 결과를 처리한다.

윈도우와 뷰 사이는 뷰 컨트롤러를 통해 연결된다. 뷰 컨트롤러는 뷰의 계층을 관리하여 윈도우에 전달하고, 모바일 디바이스에서 감지된 터치 이벤트를 윈도우로부터 전달받아 처리하는 역할을 한다. 윈도우가 뷰를 직접 참조하지 않고 뷰 컨트롤러가 그 사이를 중계하는 구조덕분에 윈도우는 뷰 컨트롤러를 통해 제공하는 뷰를 읽어 들여 표현할 뿐, 뷰를 직접 관리하지 않아도 된다.

두 개의 씬으로 이루어진 애플리케이션이 있다면 각각의 씬을 표현할 두 개의 뷰 컨트롤러가 필요하다. 씬을 담당하고 콘텐츠를 표시하는 뷰 컨트롤러를 콘텐츠 뷰 컨트롤러 라고 한다.

### 2.3.2 ViewController

ViewController 는 앱의 근간을 이루는 객체이다. 뷰를 관리하는 것이지만, 단순히 여기서 그치지 않고 화면과 데이터 사이의 상호 작용까지 관리하기도 한다. 윈도우 객체로부터 전달된 이벤트를 받아 내부적으로 구현된 비즈니스로직을 실행하고 그 결과로 얻어진 데이터를 콘텐츠로 만들어 화면으로 표현하는 등, 모바일 애플리케이션에서 뷰 컨트롤러는 우리가 하는 대부분 작업들의 중심에 있다. 다음은 주요 뷰 컨트롤러 종류이다.

    ViewController : iOS에서 가장 기본이 되는 컨트롤러로서 앱의 데이터와 표시될 외형을 연결해서 하나의 동적인 하면을 만들어 내는 컨트롤러이다. 뷰 컨트롤러에 해당하는 UIKit 프레임워크의 클래스는 UIViewController이다. 
    NavigationController : 앱의 화면 이동에 대한 관리와 그에 연관된 처리를 담당해주는 컨트롤러이다. 내부적으로 다른 컨트롤러를 포함하면서 컨트롤러끼리의 화면 이동을 처리해주고 현재의 페이지 위치에 대한 내비게이션 역할을 한다. 뷰를 포함하고 있지 않으므로 하나의 화면을 담당하지는 못하고, 다른 컨트롤러와 결합하여 부분적으로 화면을 구성한다. 
    TableViewController : 내부의 리스트 형식의 테이블 뷰를 포함하고 있어 여러 항목이나 데이터를 화면에 나열하기 위한 목적으로 사용되는 컨트롤러. ViewController 와 마찬가지로 하나의 컨트롤러가 하나의 화면을 이루는 화면 단위 컨트롤러이다. 
    TabBarController : 화면을 나타내는 여러 개의 탭이 있고, 탭을 터치하면 화면이 전환되는 형태의 앱을 만들고자 할때 사용되는 컨트롤러이다. 탭마다 다른 뷰 컨트롤러를 연결하여 화면을 구성하며 앞의 내비게이션 컨트롤러와 마찬가지로 직접 화면 전체를 나타내는 것이 아닌 복합적으로 화면을 구성하는 역할을 한다.  
    SplitViewController : 프로젝트 템플릿 선택 단계에서 Master-Detail Application 템플릿을 선택하면 생성되는 기본 컨트롤러이다. 목록을 나열하는 마스터 페이지와 그 목록 각각에 대한 세브 내용을 보여주는 디테일 페이지로 구성되는 스플릿 뷰 컨트롤러는 화면 크기에 따라 두 페이지를 하나의 화면에 조합하여 보여줄 것인지 아니면 두 개의 화면을 나누어 보여줄 것인지 자동으로 처리해주는 특징이 있다. 직접적인 화면을 구현하진 않고 마스터/디테일 페이지로 사용할 뷰 컨트롤러들을 화면의 크기에 따라 적절히 조합해주는 역할만 수행한다.
    
### 2.3.3 ViewController 의 상태 변화와 생명 주기

앱의 생명 주기는 Not Running 상태에서 Inactive, Active 과정을 거쳐 Suspended 까지 변화한 다음 다시 Not Running 상태로 돌아가는 일련의 흐름을 가진다. 간단히 앱을 실행하거나 화면을 전환하면 생성된 객체는 메모리에 로드되어 자신의 역할을 한다. 주어진 역할울 모두 끝내면 앱은 이전 장면으로 복귀하고, 생성되었던 뷰 컨트롤러 객체는 메모리에서 해제되면서 소멸한다. 필요에 의해 그 장면으로 다시 전환할 경우, 뷰 컨트롤러 객체는 이미 소멸된 후이기 때문에 다시 새롭게 생성되고, 역할을 끝내면 소멸되는데. 뷰 컨트롤러의 생명주기는 이 과정을 순환한다.

뷰 컨트롤러는 다음과 같이 네 가지 상태로 나눌 수 있다
    
    Appearing : 뷰컨트롤러가 스크린에 등장하기 시작한 순간부터 등장이 완료하기 직전까지의 상태이다. 퇴장 중인 다른 뷰 컨트롤러와 교차하기도 하며, 이때 퇴장 중인 다른 뷰 컨트롤러의 상태는 Disappearing가 된다. 
    Appeared : 뷰 컨트롤러가 스크린 전체에 완전히 등장한 상태  
    Disappearing : 뷰 컨트롤러가 스크린에서 가려지기 시작해서 완전히 가려지기 직전까지의 상태, 또는 퇴장하기 시작해서 완전히 퇴장하기 직전까지의 상태. 이 상태의 뷰 컨트롤러는 새로 등장할 뷰 컨트롤러와 교차하기도 하며, 이때 등장 중인 다른 뷰 컨트롤러의 상태는 Appearing 이다. 
    Disappeared : 뷰 컨트롤러가 스크린에서 완전히 가려졌거나 혹은 퇴장한 상태.

화면이 처음 실행되거나 또는 퇴장한 상태에서 다시 등장하기 시작하는 상태(viewWillAppear) -> 화면이 등장하기 시작한 단계를 넘어 완전히 등장(viewDidAppear) -> 앱이 백그라운드로 내려가는 등 스크린에서 화면이 퇴장하는 상태(viewWillDisAppear) -> 상태변화가 완료(viewDidDisAppear)

