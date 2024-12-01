document.addEventListener("DOMContentLoaded", () => {
    const updateQuantity = (productId, newQuantity) => {
        fetch(`/cart/update/${productId}`, {
            method: "PATCH",
            headers: {
                "Content-Type": "application/json",
                "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
            },
            body: JSON.stringify({ quantity: newQuantity }),
        })
            .then((response) => response.json())
            .then((data) => {
                // Оновлення ціни за одиницю товару
                document.getElementById(`item-price-${productId}`).textContent = data.item_price;

                // Оновлення загальної суми
                document.getElementById("cart-total-price").textContent = data.total_price;
            });
    };

    // Логіка для кнопок + і -
    document.querySelectorAll(".quantity-button").forEach((button) => {
        button.addEventListener("click", (event) => {
            const productId = event.target.dataset.productId;
            const input = document.querySelector(`.quantity-input[data-product-id="${productId}"]`);
            let newQuantity = parseInt(input.value);

            if (event.target.dataset.action === "increase" && newQuantity < 10) {
                newQuantity++;
            } else if (event.target.dataset.action === "decrease" && newQuantity > 1) {
                newQuantity--;
            }

            input.value = newQuantity;
            updateQuantity(productId, newQuantity);
        });
    });

    // Логіка для ручного введення кількості
    document.querySelectorAll(".quantity-input").forEach((input) => {
        input.addEventListener("change", (event) => {
            const productId = event.target.dataset.productId;
            const newQuantity = parseInt(event.target.value);

            if (newQuantity >= 1 && newQuantity <= 10) {
                updateQuantity(productId, newQuantity);
            } else {
                input.value = 1; // Повернення до мінімального значення
            }
        });
    });
});
