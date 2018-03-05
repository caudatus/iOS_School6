# UICollectionView
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


## Flow Layout Attributes
* UICollectionViewDelegateFlowLayout protocol 이용
* UICollectionViewDelegate가 정의된 인스턴스에서 작성
*
<img src="/Img/Class/flow_horiz_layout_uneven.png" title="collectionView" float="center">

```swift
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
```

## Item Size
