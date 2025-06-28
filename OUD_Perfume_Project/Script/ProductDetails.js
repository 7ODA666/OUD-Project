
function increaseQty() {
    let input = document.getElementById('quantity-input');
    input.value = parseInt(input.value) + 1;
}

function decreaseQty() {
    let input = document.getElementById('quantity-input');
    if (parseInt(input.value) > 1) {
        input.value = parseInt(input.value) - 1;
    }
}