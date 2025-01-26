document.addEventListener("DOMContentLoaded", () => {
  const productSelect = document.getElementById("sale_product_id");
  const quantityInput = document.getElementById("sale_quantity");
  const unitPriceInput = document.getElementById("sale_unit_price");
  const totalPriceInput = document.getElementById("sale_total_price");

  productSelect.addEventListener("change", () => {
    const selectedProduct = productSelect.options[productSelect.selectedIndex];
    const unitPrice = selectedProduct.getAttribute("data-price");

    unitPriceInput.value = unitPrice || "";
    calculateTotalPrice();
  });

  quantityInput.addEventListener("input", () => {
    calculateTotalPrice();
  });

  function calculateTotalPrice() {
    const unitPrice = parseFloat(unitPriceInput.value || 0);
    const quantity = parseInt(quantityInput.value || 0);
    totalPriceInput.value = (unitPrice * quantity).toFixed(2);
  }
});
