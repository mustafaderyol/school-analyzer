/* === School Analyzer — JavaScript === */

// Category accordion toggle
function toggleCategory(el) {
    const section = el.closest('.category-section') || el.closest('.comparison-category');
    if (section) {
        section.classList.toggle('collapsed');
    }
}

// Notes toggle
function toggleNotes(questionId) {
    const wrapper = document.getElementById(`notes_wrapper_${questionId}`);
    if (wrapper) {
        wrapper.classList.toggle('hidden');
        if (!wrapper.classList.contains('hidden')) {
            wrapper.querySelector('textarea').focus();
        }
    }
}

// Auto-dismiss alerts after 5 seconds
document.addEventListener('DOMContentLoaded', function() {
    const alerts = document.querySelectorAll('.alert');
    alerts.forEach(function(alert) {
        setTimeout(function() {
            alert.style.opacity = '0';
            alert.style.transform = 'translateY(-10px)';
            setTimeout(function() { alert.remove(); }, 300);
        }, 5000);
    });
});
