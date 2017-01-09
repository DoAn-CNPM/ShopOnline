jQuery(document).ready(function() {
            var offset = 70;
            var duration = 500;
            jQuery(window).scroll(function() {
                if (jQuery(this).scrollTop() > offset) {
                    jQuery('.back-to-top').fadeIn(duration);
                } else {
                    jQuery('.back-to-top').fadeOut(duration);
                }
            });

            jQuery('.back-to-top').click(function(event) {
                event.preventDefault();
                jQuery('html, body').animate({
                    scrollTop: 0
                }, duration);
                return false;
            })
        });
        jQuery(document).ready(function() {
            var duration = 500;
            jQuery('.back-to-down').click(function(event) {
                event.preventDefault();
                jQuery('html, body').animate({
                    scrollTop: 525
                }, duration);
                return false;
            })
        });