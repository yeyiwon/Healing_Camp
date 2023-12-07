document.addEventListener('DOMContentLoaded', function () {
    const faqTitles = document.querySelectorAll('.faq-title');

    faqTitles.forEach(title => {
        title.addEventListener('click', function () {
            const content = this.nextElementSibling;
            content.style.display = (content.style.display === 'none' || content.style.display === '') ? 'block' : 'none';
        });
    });
});