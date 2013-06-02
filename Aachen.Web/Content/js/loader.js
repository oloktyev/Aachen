(function () {
    function loadScript(url) {
        var script = document.createElement("script")
        script.type = "text/javascript";
        script.src = url;
        document.getElementsByTagName("head")[0].appendChild(script);
    }

    if (document.documentElement.clientWidth >= 940)
        loadScript('/content/js/desktop/release/aachen-desktop.js');
    else
        loadScript('/content/js/mobile/release/aachen-mobile.js')
})();