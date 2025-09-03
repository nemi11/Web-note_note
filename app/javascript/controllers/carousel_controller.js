import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["slides", "dots"]

connect() {
  this.currentIndex = 0
  this.cloneSlides()
  this.updateSlide()
  this.startAutoSlide()
  }  // ← カンマはいらない

cloneSlides() {
  const slides = this.slidesTarget.children
  const first = slides[0].cloneNode(true)
  const last = slides[slides.length - 1].cloneNode(true)
  this.slidesTarget.appendChild(first)
  this.slidesTarget.insertBefore(last, slides[0])
  this.currentIndex = 1
  }

  nextSlide() {
    this.currentIndex = (this.currentIndex + 1) % this.slidesTarget.children.length
    this.updateSlide()
  }

  prevSlide() {
    this.currentIndex = (this.currentIndex - 1 + this.slidesTarget.children.length) % this.slidesTarget.children.length
    this.updateSlide()
  }

  goToSlide(event) {
  const clickedIndex = Number(event.currentTarget.dataset.index)
  
  // クローンを使っている場合、現在インデックスは +1 からスタートしている
  this.currentIndex = clickedIndex + 1 
  this.updateSlide()
}

updateSlide() {
  const containerWidth = this.slidesTarget.parentElement.offsetWidth
  const slideWidth = this.slidesTarget.children[0].offsetWidth
  const gap = 20

  // 中央にくるようにオフセット計算
  let offset = this.currentIndex * (slideWidth + gap) - (containerWidth / 2 - slideWidth / 2)

  // スライドの端でオーバーフローしないよう制限
  const maxOffset = this.slidesTarget.scrollWidth - containerWidth
  if (offset < 0) offset = 0
  if (offset > maxOffset) offset = maxOffset

  this.slidesTarget.style.transform = `translateX(-${offset}px)`

  // ドットのアクティブ更新
  if (this.hasDotsTarget) {
    this.dotsTarget.querySelectorAll(".dot").forEach((dot, i) => {
      // クローンがある場合は currentIndex - 1 でオリジナルのスライドに対応
      dot.classList.toggle("active", i === this.currentIndex - 1)
    })
  }
}


  updateSlide() {
    const containerWidth = this.slidesTarget.parentElement.offsetWidth
    const slideWidth = this.slidesTarget.children[0].offsetWidth
    const gap = 30
    let offset = this.currentIndex * (slideWidth + gap) - (containerWidth / 2 - slideWidth / 2)
    const maxOffset = this.slidesTarget.scrollWidth - containerWidth
    if (offset < 0) offset = 0
    if (offset > maxOffset) offset = maxOffset
    this.slidesTarget.style.transform = `translateX(-${offset}px)`

    if (this.hasDotsTarget) {
      this.dotsTarget.querySelectorAll(".dot").forEach((dot, i) => {
        dot.classList.toggle("active", i === this.currentIndex)
      })
    }
  }

  startAutoSlide() {
    this.timer = setInterval(() => this.nextSlide(), 3000)
  }

  disconnect() {
    clearInterval(this.timer)
  }

  nextSlide() {
  // 今までは右に進む → 左に行くように逆にする
  this.currentIndex = (this.currentIndex - 1 + this.slidesTarget.children.length) % this.slidesTarget.children.length
  this.updateSlide()
}

prevSlide() {
  // 今までは左に戻る → 右に行くように逆にする
  this.currentIndex = (this.currentIndex + 1) % this.slidesTarget.children.length
  this.updateSlide()
}
}

