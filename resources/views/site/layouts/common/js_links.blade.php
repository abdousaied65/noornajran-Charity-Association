<script src="{{asset('admin-assets/js/jquery.min.js')}}"></script>
<!-- Vendor JS Files -->
<script src="{{asset('assets/vendor/aos/aos.js')}}"></script>
<script src="{{asset('assets/vendor/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
<script src="{{asset('assets/vendor/glightbox/js/glightbox.min.js')}}"></script>
<script src="{{asset('assets/vendor/isotope-layout/isotope.pkgd.min.js')}}"></script>
<script src="{{asset('assets/vendor/swiper/swiper-bundle.min.js')}}"></script>
<!-- Template Main JS File -->
<script src="{{asset('assets/js/main.js')}}"></script>
<script src="{{asset('assets/js/select2.min.js')}}"></script>
<script>
    $('.js-example-basic-single').select2({
        placeholder: "اختر مما يلى"
    });
    $('.progress-pie-chart').each(function () {
        var $ppc = $(this),
            percent = parseInt($ppc.data('percent')),
            deg = 360 * percent / 100;
        if (percent > 50) {
            $ppc.addClass('gt-50');
        }
        if (percent <= 25) {
            $ppc.addClass('red');
        } else if (percent >= 25 && percent <= 90) {
            $ppc.addClass('orange');
        } else if (percent >= 90) {
            $ppc.addClass('green');
        }
        $ppc.find('.ppc-progress-fill').css('transform', 'rotate(' + deg + 'deg)');
    });
</script>

