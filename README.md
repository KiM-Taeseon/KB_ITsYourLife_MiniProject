# ☕️ ZOOMBUCKS

> 커피주문 키오스크 서비스
> 
> 프로젝트 목표 : JDBC를 통해 DB를 연동하여 키오스크 서비스 구현해보기
> 
> 기대효과 : 카페에서 키오스크의 기능을 사용할 수 있다.
> 
> 시연영상 👉

## ⚒️ 스택
**Language** : JAVA11 / OracleDataBase 21C XE

**Develop Tool** : Eclipse

**Manage Tool** : Git

## 🗓️ 프로젝트 기간
- 2022.04.03 ~ 2022.04.06 (총 4일)

## 🔥 주요 기능
```
1. 음료 메뉴 전체 조회
2. 음료에 대한 정보 상세보기
3. 주문하기
  3-1. 메뉴선택
  3-2. 수량 
  3-3. HOT/ICE 선택
  3-4. 추가주문 여부 선택
4. 주문한 내역 보여주고 총 결제금액 계산 후 고객에게 보여줌 
```

## 💾 DataBase 구조
![DB](README.assets/DB.png)

## MVC
![MVC](README.assets/MVC.png)

## 🗂️ 프로젝트 폴더 구조
```
📦resources
 ┣ 📂schema
 ┃ ┗ 📜Coffee_Order.sql
 ┗ 📜.DS_Store
📦src
 ┣ 📂cafe
 ┃ ┣ 📂common
 ┃ ┃ ┣ 📜DBManager.java
 ┃ ┃ ┗ 📜DBProperties.java
 ┃ ┣ 📂controller
 ┃ ┃ ┗ 📜CafeController.java
 ┃ ┣ 📂dao
 ┃ ┃ ┣ 📜CoffeeDAO.java
 ┃ ┃ ┣ 📜CoffeeDAOImpl.java
 ┃ ┃ ┣ 📜OrderDAO.java
 ┃ ┃ ┗ 📜OrderDAOImpl.java
 ┃ ┣ 📂dto
 ┃ ┃ ┣ 📜CoffeeDto.java
 ┃ ┃ ┣ 📜OrderDetailDto.java
 ┃ ┃ ┗ 📜OrderDto.java
 ┃ ┣ 📂exception
 ┃ ┃ ┣ 📜DMLException.java
 ┃ ┃ ┗ 📜SearchWrongException.java
 ┃ ┣ 📂service
 ┃ ┃ ┣ 📜CafeService.java
 ┃ ┃ ┗ 📜CafeServiceImpl.java
 ┃ ┣ 📂view
 ┃ ┃ ┣ 📜FailView.java
 ┃ ┃ ┣ 📜MainApp.java
 ┃ ┃ ┣ 📜MenuView.java
 ┃ ┃ ┣ 📜SuccessView.java
 ┃ ┃ ┗ 📜TestView.java
 ┃ ┗ 📜.DS_Store
 ┣ 📂test
 ┃ ┗ 📜Test.java
 ┗ 📜.DS_Store
 ```
 ## 📸 프로젝트 화면 캡처
 <details>
  <summary>0. 처음 시작 화면 </summary>
  <img width="765" alt="capture01" src="https://user-images.githubusercontent.com/62579544/235347510-e622d7c0-b47e-4eb3-9b56-dc76c77a684c.png">
 </details>
 
<details>
  <summary>1. 전체 음료 메뉴 조회 </summary>
 <img width="763" alt="capture02" src="https://user-images.githubusercontent.com/62579544/235347809-09718e6e-30fb-4192-85d5-099ab4141352.png">
</details>
 
<details>
  <summary>2. 음료 상세정보 보기 </summary>
 <img width="763" alt="capture03" src="https://user-images.githubusercontent.com/62579544/235347865-c2b6ef32-4110-4d60-a34a-2754b25245b6.png">
</details>

<details>
  <summary>3. 주문하기 </summary>
 <img width="755" alt="capture04" src="https://user-images.githubusercontent.com/62579544/235347880-dd8aacd3-74c6-47e4-b537-2c072233f6b9.png">
</details>

<details>
  <summary>4. 주문한 메뉴 및 결제금액 출력</summary>
 <img width="391" alt="capture05" src="https://user-images.githubusercontent.com/62579544/235453413-64c4fa19-f0c3-4227-a8aa-a25bbac3e360.png">
</details>

<details>
  <summary>5. 종료하기 </summary>
 <img width="765" alt="capture06" src="https://user-images.githubusercontent.com/62579544/235453453-26edcbdc-587e-4959-ab5c-ffd2af7cfe9c.png">
</details>

<br/>

## 👨‍👧‍👦 팀원소개
<table border="1">
	<th>곽승규</th>
	<th>김태선</th>
  <th>윤소민</th>
	<tr>
	    <td><img src="https://avatars.githubusercontent.com/u/62579544?v=4" width="200"/></td>
	    <td><img src="https://avatars.githubusercontent.com/u/127369505?v=4" width="250"/></td>
      <td><img src="https://avatars.githubusercontent.com/u/55522263?v=4" width="200"/></td>  
	</tr>
	<tr>
	    <td>
        1. 프로젝트 MVC 내부 구성 및 <br/> Package 구조화 <br/>
    	2. 사용자정의 예외 처리 <br/>
        3. 커피 DTO, 주문 DTO, 커피 DAO,<br/> 주문 DAO, 카페 Service, Controller <br/> 작성 <br/>
	4. 프로젝트 발표
      </td>
	    <td>
        1. SQL문 작성<br/>
        2. DB생성 및 구축<br/>
	3. 커피 DAO, 주문 DAO 작성<br/>	    
        4. PPT 작성
      </td>
      <td>
       1. 카페 Service 및 MainView 작성<br/>
       2. 커피 DTO, 커피 DAO 작성 <br/> 
       3. 시연영상 촬영 및 편집
      </td>
	</tr>
</table>

## 🚀 프로젝트에 대한 총평

> 긍정적인 부분 : 주문테이블과 주문상세테이블을 한 트랜잭션 안에서 코드를 구현하려고 노력하였고 시간이 오래 걸렸지만 성공시켰습니다.
> 
> 아쉬운 부분 : 예외처리 하는 부분에 대해 완벽하게 처리하지 못한 부분이 있어 아쉬움이 남았습니다.
> 
> 향후 발전방안 : 장바구니 기능 추가, 주문 취소 기능 추가


## ☺️ 느낀점

- 곽승규

 단기로 진행한 프로젝트여서 구현 및 기능에서 아쉬운 점이 있으나 팀원들과 함께 의견을 공유하면서 MVC 구조의 카페 키오스크를 구현할 수 있었습니다.
 
 해당 프로젝트를 통해 MVC 구조에 대해 이해할 수 있었고 Oracle DB와 연동하여 핵심 기능인 카페 음료 주문 기능을 구현할 수 있어서 스스로의 공부도 되
 었던 뜻 깊은 프로젝트 였습니다.
 
- 김태선

 아이디어부터 구상, 설계 및 구현까지 모든 걸 생각하고 해결해 나가는 것이 여간 쉬운 일이 아니었습니다. 하지만 각자의 역할을 맡아 분업과 협업을 진행하여 프로젝트를 마칠 수 있었다는 느낌이 들고 DB 뿐만 아니라 코드 부분에서 많이 연습이 필요하다는 걸 느꼈습니다.
 
- 윤소민

 주문 DTO에 주문 상세정보를 저장할 변수를 만들어 주문상세정보를 다룰 수 있게 했던 부분이 신기했습니다. Git 사용법이 익숙치 않아 시간이 걸렸던 부분이 있었지만 앞으로 더 많이 사용해보면서 공부해야겠다고 생각했습니다.
