/**
 * @author Batch Themes Ltd.
 */
(function () {
    'use strict';

    $(function () {
        var config = $.localStorage.get('config');
        $('body').attr('data-layout', config.layout);
        $('body').attr('data-palette', config.theme);
        $('body').attr('data-direction', config.direction);
        $('button[data-animate]').on('click', function () {
            var id = $(this).data('animate');
            animateButton('#' + id);
        });

    });

})();
