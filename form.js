document.getElementById("contactForm").addEventListener("submit", async function (e) {
    e.preventDefault();

    const form = e.target;
    const formData = new FormData(form);

    // ✅ Access key added in JS
    formData.append("access_key", "fdff9149-19fc-4bf3-8a40-f83b405de0d0");

    try {
        const response = await fetch("https://api.web3forms.com/submit", {
            method: "POST",
            body: formData
        });

        const result = await response.json();

        if (result.success) {
            showPopup();
            form.reset();
        } else {
            alert(result.message || "Something went wrong!");
        }

    } catch (error) {
        console.log(error);
        alert("Network error. Try again!");
    }
});

function showPopup() {
    document.getElementById("thankPopup").style.display = "flex";
}

function closePopup() {
    document.getElementById("thankPopup").style.display = "none";
}