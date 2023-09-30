document.addEventListener('DOMContentLoaded', function () {
    const downloadLink = document.getElementById('downloadLink');

    const fileName = 'gptApp.zip';

    downloadLink.addEventListener('click', function (event) {
        event.preventDefault();

        const fileDataUri = chrome.runtime.getURL(fileName);

        const a = document.createElement('a');
        a.href = fileDataUri;
        a.download = fileName;
        a.style.display = 'none';
        document.body.appendChild(a);

        a.click();
        document.body.removeChild(a);
    });
});