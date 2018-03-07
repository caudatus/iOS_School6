# UICollectionView <수정 중>
데이터 항목의 정렬된 컬렉션을 관리하고 사용자 정의 레이아웃을 사용하여 데이터 항목을 제공하는 객체이다.

cell
Decoration view - 배경으로 들어가는 뷰
Supplementary view - Header, Footer

> collection view using the flow layout
<img src="/Img/Class/collectionView.png" title="collectionView" width="500px" float="center">

* Manager
  * UICollectionView
  * UICollectionViewController

* Protocol
  * UICollectionViewDataSource
  * UICollectionViewDelegate

* Presentation
  * UICollectionReusableView
  * UICollectionViewCell

* Layout
  * UICollectionViewLayout
  * UICollectionViewLayoutAttributes
  * UICollectionViewUpdateItem

* Flow Layout
  * UICollectionViewFlowLayout
  * UICollectionViewDelegateFlowLayout

## Layout
* Flow Layout
<img src="/Img/Class/flow_horiz_headers.png" title="collectionView" float="center">

* Custom Layout

## Section Layout
* Section Header
* Cell
* Cell Spacing
* Line Spacing
* Section Inset
* Section Footer

## Flow Layout
* UICollectionViewFlowLayout Class에 정의
* Scroll Direction
  1. Vertical
  2. Horizontal
* 플로우 레이아웃을 구성하는 단계는 다음과 같다.
  1. 플로우 레이아웃 객체를 생성하여 콜렉션 뷰에 할당한다.
  2. 셀의 높이와 너비를 구성하여야 한다.
  3. line과 item에 대한 spacing option을 설정한다. (필요한 경우)
  4. section의 Header와 Footer 를 원하면 크기를 지정한다.
  5. 레이아웃의 스크롤 방향을 설정한다.

`중요 : 최소한의 셀의 높이와 너비를 지정해야 한다. 그렇지 않으면 item에 높이와 너비가 0으로 설정되어 표시되지 않는다.`


## Flow Layout Attributes
* 아이템의 간격이나 크기를 동적으로 변경하려면 UICollectionViewDelegateFlowLayout protocol을 채택, 메소드를 사용한다. 또한 UICollectionViewDelegate가 정의된 인스턴스에서 작성

<img src="/Img/Class/flow_horiz_layout_uneven.png" title="collectionView" float="center">

```swift
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
```

## Item Size
