import { Controller } from "@hotwired/stimulus";
export default class extends Controller {
  static targets = ["wrapper", "element", "slideOver"];

  connect() {
    // this.closeOnOutsideClick = this.closeOnOutsideClick.bind(this);
    // document.addEventListener("click", this.closeOnOutsideClick);

    this.slideOverTarget.classList.add("translate-x-full");
    setTimeout(() => {
      this.slideOverTarget.classList.remove("translate-x-full");
      this.slideOverTarget.classList.add(
        "transform",
        "transition",
        "ease-in-out",
        "duration-700",
        "translate-x-0"
      );
    }, 20);
  }

  disconnect() {
    document.removeEventListener("click", this.closeOnOutsideClick);
  }

  slideOut() {
    this.slideOverTarget.classList.remove("translate-x-0");
    this.slideOverTarget.classList.add(
      "transform",
      "transition",
      "ease-in-out",
      "duration-700",
      "translate-x-full"
    );

    setTimeout(() => { this.elementTarget.remove(); }, 300);
  }

  closeOnOutsideClick(event) {
    event.preventDefault();

    const isClickInside = this.wrapperTarget.contains(event.target)

    if (!isClickInside) {
      this.slideOut();
    }
  }
}
