//<![CDATA[
    if ((typeof Haravan) === 'undefined') {
        Haravan = {};
    }
    Haravan.culture = 'vi-VN';
    Haravan.shop = 'phukienhanghieu.myharavan.com';
    Haravan.theme = {
        "name": "Theme thử lần 2",
        "id": 1000509982,
        "role": "main"
    };
    Haravan.domain = 'mandofashion.vn';
    //]]>

    window.HaravanAnalytics = window.HaravanAnalytics || {};
    window.HaravanAnalytics.meta = window.HaravanAnalytics.meta || {};
    window.HaravanAnalytics.meta.currency = 'VND';
    var meta = {
        "page": {
            "pageType": "home"
        }
    };
    for (var attr in meta) {
        window.HaravanAnalytics.meta[attr] = meta[attr];
    }
    window.HaravanAnalytics.AutoTrack = true;