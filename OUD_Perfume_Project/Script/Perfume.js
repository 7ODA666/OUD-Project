new WOW().init();


//! Hamburger Menu

const hamburger = document.getElementById('hamburger');
const navMenu = document.getElementById('nav-menu');

hamburger.addEventListener('click', () => {
    navMenu.classList.toggle('active');
});


// Logout Dropdown
function toggleDropdown() {
    document.getElementById("userDropdown").classList.toggle("active");
}
document.addEventListener("click", function (event) {
    const dropdown = document.getElementById("userDropdown");

    if (dropdown && !dropdown.contains(event.target)) {
        dropdown.classList.remove("active");
    }
});


//! Cart Sidebar ( Open and Close )
function openCart() {
    // Get CartSummary 
    $.ajax({
        url: '/Cart/CartSummary', 
        type: 'GET',
        success: function (result) {
            $('#cartContainer').html(result); // return Content' ViewCartSummary in Div Container
            document.getElementById("cartSidebar").classList.add("active");
            document.getElementById("overlay").style.display = "block";
        },
        error: function () {
            alert("Error loading cart");
        }
    });
}

function closeCart() {
    document.getElementById("cartSidebar").classList.remove("active");
    document.getElementById("overlay").style.display = "none";
}


//! Testimonials section

document.addEventListener("DOMContentLoaded", function () {
    const sliderTrack = document.getElementById("sliderTrack");
    const allTestimonials = Array.from(document.querySelectorAll(".testimonial"));
    const dotsContainer = document.getElementById("dots");

    if (!sliderTrack || allTestimonials.length === 0 || !dotsContainer) {
        console.warn("Slider not found or missing testimonials or dots");
        return;
    }

    const testimonials = allTestimonials.slice(-6);
    sliderTrack.innerHTML = '';
    testimonials.forEach(t => sliderTrack.appendChild(t));

    let currentSlide = 0;

    function testimonialsPerSlide() {
        if (window.innerWidth <= 600) return 1;
        if (window.innerWidth <= 992) return 2;
        return 3;
    }

    function totalSlides() {
        return Math.ceil(testimonials.length / testimonialsPerSlide());
    }

    function createDots() {
        dotsContainer.innerHTML = '';
        for (let i = 0; i < totalSlides(); i++) {
            const dot = document.createElement("span");
            dot.className = "dot";
            if (i === currentSlide) dot.classList.add("active");
            dot.addEventListener("click", () => {
                currentSlide = i;
                moveSlider();
            });
            dotsContainer.appendChild(dot);
        }
    }

    function moveSlider() {
        const width = sliderTrack.offsetWidth / testimonialsPerSlide();
        sliderTrack.style.transform = `translateX(-${currentSlide * width}px)`;
        updateDots();
    }

    function updateDots() {
        const dots = document.querySelectorAll(".dot");
        dots.forEach(dot => dot.classList.remove("active"));
        if (dots[currentSlide]) dots[currentSlide].classList.add("active");
    }

    function autoSlide() {
        currentSlide = (currentSlide + 1) % totalSlides();
        moveSlider();
    }

    window.addEventListener("resize", () => {
        currentSlide = 0;
        moveSlider();
        createDots();
    });

    createDots();
    moveSlider();
    setInterval(autoSlide, 5000);
});

//! Other

// Add to Cart
$(document).ready(function () {
    // Add to Cart in Product Section
    $('.add-to-cart').click(function (e) {
        e.preventDefault();

        let productId = $(this).data('product-id');
        let quantity = $(this).data('quantity');

        sendAddToCart(productId, quantity);
    });

    // Add to Cart in ProductDetails Section
    $('#add-to-cart-details').click(function (e) {
        e.preventDefault();

        let productId = $(this).data('product-id');
        let quantity = $('#quantity-input').val();

        sendAddToCart(productId, quantity);
    });

   // Send Add to Cart for Action 
    function sendAddToCart(productId, quantity) {
        $.ajax({
            url: '/Cart/AddToCart',
            type: 'POST',
            data: { productId: productId, quantity: quantity },
            success: function (response) {
                if (response.success) {
                    alert("Product added to cart!");
                    reloadCartHeader();
                } else if (response.redirectUrl) {
                    window.location.href = response.redirectUrl;
                }
            }
        });
    }
});


// Reload Count Cart Header
function reloadCartHeader() {
    $.ajax({
        url: '/Cart/GetCartCount',
        type: 'GET',
        success: function (result) {
            $('#cart-header-placeholder').html(result);
        }
    });
}