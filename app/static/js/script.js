document.addEventListener("DOMContentLoaded", () => {

    // Progress Bar Animation
    const progressBar = document.querySelector(".progress-bar");

    if (progressBar) {
        const progress = progressBar.getAttribute("aria-valuenow") || 0;

        progressBar.style.width = "0%";

        setTimeout(() => {
            progressBar.style.width = progress + "%";
        }, 300);
    }

    // Auto dismiss flash messages
    const alerts = document.querySelectorAll(".alert");

    alerts.forEach(alert => {
        setTimeout(() => {
            const bsAlert = bootstrap.Alert.getOrCreateInstance(alert);
            bsAlert.close();
        }, 4000);
    });

    // Task card hover effect
    document.querySelectorAll(".task-card").forEach(card => {

        card.addEventListener("mouseenter", () => {
            card.style.transform = "translateY(-6px)";
        });

        card.addEventListener("mouseleave", () => {
            card.style.transform = "translateY(0)";
        });

    });

});