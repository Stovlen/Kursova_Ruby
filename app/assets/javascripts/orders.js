document.addEventListener("DOMContentLoaded", function () {
    const deliveryMethodSelect = document.getElementById("delivery-method-select");
    const branchNumberField = document.getElementById("branch-number-field");

    if (deliveryMethodSelect) {
        deliveryMethodSelect.addEventListener("change", function () {
            if (this.value === "Укрпошта") {
                branchNumberField.setAttribute("maxlength", "5");
                branchNumberField.setAttribute("pattern", "\\d{5}"); // Обов'язково 5 цифр
                branchNumberField.setAttribute("title", "Номер відділення Укрпошти повинен складатися з 5 цифр");
            } else {
                branchNumberField.removeAttribute("maxlength");
                branchNumberField.removeAttribute("pattern");
                branchNumberField.removeAttribute("title");
            }
        });
    }
});
