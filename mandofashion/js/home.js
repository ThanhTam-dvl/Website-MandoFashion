window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());

        gtag('config', 'G-BDBXBRLTWX');

//<![CDATA[
    (function() {
        function asyncLoad() {
            var urls = ["https://onapp.haravan.com/promotionbar/embed/asset/frontend/promotionbar.js?shop=phukienhanghieu.myharavan.com&ver=1681456200750"];
            for (var i = 0; i < urls.length; i++) {
                var s = document.createElement('script');
                s.type = 'text/javascript';
                s.async = true;
                s.src = urls[i];
                var x = document.getElementsByTagName('script')[0];
                x.parentNode.insertBefore(s, x);
            }
        }
        window.attachEvent ? window.attachEvent('onload', asyncLoad) : window.addEventListener('load', asyncLoad, false);
    })();
    //]]>
    function
    window.HaravanAnalytics.ga4 = "G-BDBXBRLTWX";
    window.HaravanAnalytics.enhancedEcommercev4 = true;
    window.dataLayer = window.dataLayer || [];

    function gtag() {
        dataLayer.push(arguments);
    }
    gtag('js', new Date());
    gtag('config', 'G-BDBXBRLTWX');

    window.HaravanAnalytics.fb = "359212484441800";
    //<![CDATA[
    ! function(f, b, e, v, n, t, s) {
        if (f.fbq) return;
        n = f.fbq = function() {
            n.callMethod ?
                n.callMethod.apply(n, arguments) : n.queue.push(arguments)
        };
        if (!f._fbq) f._fbq = n;
        n.push = n;
        n.loaded = !0;
        n.version = '2.0';
        n.queue = [];
        t = b.createElement(e);
        t.async = !0;
        t.src = v;
        s = b.getElementsByTagName(e)[0];
        s.parentNode.insertBefore(t, s)
    }(window,
        document, 'script', '//connect.facebook.net/en_US/fbevents.js');
    // Insert Your Facebook Pixel ID below. 
    fbq('init', window.HaravanAnalytics.fb, {}, {
        'agent': 'plharavan'
    });
    fbq('track', 'PageView');
    //]]>
    
    var formatMoney = '{{amount}}₫';
    jQuery.themeAssets = {
        arrowDown: '<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 12 8" style="enable-background:new 0 0 12 8; width: 12px; height: 8px;" xml:space="preserve"><polyline points="0,2 2,0 6,4 10,0 12,2 6,8 0,2 "/></svg>',
        arrowRight: '<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 31 10" style="enable-background:new 0 0 31 10; width: 31px; height: 10px;" xml:space="preserve"><polygon points="31,5 25,0 25,4 0,4 0,6 25,6 25,10 "/></svg>',
    };
    jQuery.themeCartSettings = 'overlay';


    // <!-- Google Tag Manager -->
    (function(w, d, s, l, i) {
        w[l] = w[l] || [];
        w[l].push({
            'gtm.start': new Date().getTime(),
            event: 'gtm.js'
        });
        var f = d.getElementsByTagName(s)[0],
            j = d.createElement(s),
            dl = l != 'dataLayer' ? '&l=' + l : '';
        j.async = true;
        j.src =
            'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
        f.parentNode.insertBefore(j, f);
    })(window, document, 'script', 'dataLayer', 'GTM-WV592XV');
    // <!-- End Google Tag Manager -->

    // <!-- Meta Pixel Code -->
        ! function(f, b, e, v, n, t, s) {
            if (f.fbq) return;
            n = f.fbq = function() {
                n.callMethod ?
                    n.callMethod.apply(n, arguments) : n.queue.push(arguments)
            };
            if (!f._fbq) f._fbq = n;
            n.push = n;
            n.loaded = !0;
            n.version = '2.0';
            n.queue = [];
            t = b.createElement(e);
            t.async = !0;
            t.src = v;
            s = b.getElementsByTagName(e)[0];
            s.parentNode.insertBefore(t, s)
        }(window, document, 'script',
            'https://connect.facebook.net/en_US/fbevents.js');
        fbq('init', '624024099052128');
        fbq('track', 'PageView');
    // <!-- End Meta Pixel Code -->

    var hm = hm || [];
    hm.push('setClient', 'HM-001867');
    (function() {
        var dom = document.createElement('script');
        dom.type = 'text/javascript';
        dom.async = true;
        dom.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'dashboard.smartconvert.co/js/tracker.production.js?id=b8862bf62e53f80b454c';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(dom, s);
    })();

        ! function(w, d, t) {
            w.TiktokAnalyticsObject = t;
            var ttq = w[t] = w[t] || [];
            ttq.methods = ["page", "track", "identify", "instances", "debug", "on", "off", "once", "ready", "alias", "group", "enableCookie", "disableCookie"], ttq.setAndDefer = function(t, e) {
                t[e] = function() {
                    t.push([e].concat(Array.prototype.slice.call(arguments, 0)))
                }
            };
            for (var i = 0; i < ttq.methods.length; i++) ttq.setAndDefer(ttq, ttq.methods[i]);
            ttq.instance = function(t) {
                for (var e = ttq._i[t] || [], n = 0; n < ttq.methods.length; n++) ttq.setAndDefer(e, ttq.methods[n]);
                return e
            }, ttq.load = function(e, n) {
                var i = "https://analytics.tiktok.com/i18n/pixel/events.js";
                ttq._i = ttq._i || {}, ttq._i[e] = [], ttq._i[e]._u = i, ttq._t = ttq._t || {}, ttq._t[e] = +new Date, ttq._o = ttq._o || {}, ttq._o[e] = n || {};
                var o = document.createElement("script");
                o.type = "text/javascript", o.async = !0, o.src = i + "?sdkid=" + e + "&lib=" + t;
                var a = document.getElementsByTagName("script")[0];
                a.parentNode.insertBefore(o, a)
            };
            ttq.load('CEL9JVRC77U8PGM000U0');
            ttq.page();
        }(window, document, 'ttq');

        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());

        gtag('config', 'G-BDBXBRLTWX');

        setTimeout(function() {
            animation_check();
        }, 100);

        function animation_check() {
            var scrollTop = $(window).scrollTop() - 300;
            $('.animation-tran').each(function() {
                if ($(this).offset().top < scrollTop + $(window).height()) {
                    $(this).addClass('active');
                }
            })
        }
        $(window).scroll(function() {
            //setTimeout(function(){
            animation_check();
            //}, 500);
        })