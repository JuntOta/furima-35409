window.addEventListener('load', () => {
  
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    const addTaxNumber = Math.round(inputValue * 0.1);
    addTaxDom.innerHTML = addTaxNumber;

    const ProfitDom = document.getElementById("profit");
    ProfitDom.innerHTML = Math.round(inputValue - addTaxNumber);
  })

});

