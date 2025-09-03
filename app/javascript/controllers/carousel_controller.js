import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["slides", "dots"]
  static values = { index: Number }

  connect() {
    this.indexValue = 0
    this.showSlide(this.indexValue)
    this.startAutoSlide()
    console.log("Carousel controller connected")
  }

  disconnect() {
    clearInterval(this.timer)
  }

  startAutoSlide() {
    this.timer = setInterval(() => {
      this.next()
    }, 3000) // 3秒ごとにスライド
  }

  next() {
    this.indexValue = (this.indexValue + 1) % this.slidesTarget.children.length
    this.showSlide(this.indexValue)
  }

  goToSlide(event) {
    this.indexValue = Number(event.currentTarget.dataset.index)
    this.showSlide(this.indexValue)
  }

  showSlide(index) {
    const width = this.slidesTarget.clientWidth
    this.slidesTarget.style.transform = `translateX(-${index * width}px)`

    if (this.hasDotsTarget) {
      this.dotsTarget.querySelectorAll(".dot").forEach((dot, i) => {
        dot.classList.toggle("active", i === index)
      })
    }
  }

  showSlide(index) {
  const slideWidth = this.slidesTarget.offsetWidth / this.slidesTarget.children.length
  this.slidesTarget.style.transform = `translateX(-${index * slideWidth}px)`

  if (this.hasDotsTarget) {
    this.dotsTarget.querySelectorAll(".dot").forEach((dot, i) => {
      dot.classList.toggle("active", i === index)
    })
  }
}

}
