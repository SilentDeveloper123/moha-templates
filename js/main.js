$(document).ready(function () {

  // ── Page Loader ──
  $(window).on('load', function () { $('#pageLoader').addClass('hidden'); });
  setTimeout(function () { $('#pageLoader').addClass('hidden'); }, 3000);

  // ── Mobile Menu ──
  $('.hamburger').on('click', function () {
    $('.nav-mobile').fadeIn(200).css('display', 'flex');
  });
  $('.nav-mobile .close-btn, .nav-mobile a').on('click', function () {
    $('.nav-mobile').fadeOut(200);
  });

  // ── Hero Slider ──
  if ($('.hero-slide').length > 1) {
    var si = 0, st;
    function goTo(n) {
      var slides = $('.hero-slide'), dots = $('.hero-dot');
      if (!slides.length) return;
      si = (n + slides.length) % slides.length;
      slides.removeClass('active');
      dots.removeClass('active').removeClass('bg-white').addClass('bg-white/40');
      $('.slide-bg').removeClass('active');
      slides.eq(si).addClass('active');
      dots.eq(si).addClass('active').removeClass('bg-white/40').addClass('bg-white');
      $('.slide-bg').eq(si).addClass('active');
    }
    function next() { goTo(si + 1); }
    function prev() { goTo(si - 1); }
    function start() { st = setInterval(next, 5500); }
    $('.hero-next').on('click', function () { clearInterval(st); next(); start(); });
    $('.hero-prev').on('click', function () { clearInterval(st); prev(); start(); });
    $('.hero-dot').on('click', function () {
      clearInterval(st); goTo($(this).index()); start();
    });
    start();
  }

  // ── Tabs ──
  $('.tab').on('click', function () {
    var $tabs = $(this).closest('.tab-group').find('.tab');
    $tabs.removeClass('active').removeClass('border-green-custom text-green-custom').addClass('border-transparent text-gray-400');
    $(this).addClass('active').removeClass('border-transparent text-gray-400').addClass('border-green-custom text-green-custom');
    var target = $(this).data('tab');
    $($(this).closest('.tab-group').parent().find('.tab-panel')).addClass('hidden');
    $('#' + target).removeClass('hidden');
  });

  // ── Scroll to anchor ──
  $('a[href^="#"]').on('click', function (e) {
    var t = $($(this).attr('href'));
    if (t.length) { e.preventDefault(); $('html, body').animate({ scrollTop: t.offset().top - 100 }, 500, 'swing'); }
  });

  // ── Back to Top ──
  var btt = $('<button class="back-to-top"><svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor"><path fill-rule="evenodd" d="M14.707 12.707a1 1 0 01-1.414 0L10 9.414l-3.293 3.293a1 1 0 01-1.414-1.414l4-4a1 1 0 011.414 0l4 4a1 1 0 010 1.414z" clip-rule="evenodd"/></svg></button>');
  $('body').append(btt);
  $(window).on('scroll', function () {
    $(this).scrollTop() > 500 ? btt.addClass('show') : btt.removeClass('show');
  });
  btt.on('click', function () { $('html, body').animate({ scrollTop: 0 }, 500); });

  // ── Counter Animation ──
  function animateCounters() {
    $('.stat-counter').each(function () {
      var $el = $(this), target = parseInt($el.text().replace(/,/g, '')), current = 0, step = Math.ceil(target / 40);
      if (target === 0) return;
      var interval = setInterval(function () {
        current += step;
        if (current >= target) { current = target; clearInterval(interval); }
        $el.text(current.toLocaleString());
      }, 40);
    });
  }

  // ── Intersection Observer for counters ──
  if ('IntersectionObserver' in window) {
    var observer = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (entry.isIntersecting) {
          animateCounters();
          observer.disconnect();
        }
      });
    }, { threshold: 0.5 });
    var statsEl = document.querySelector('.stats-bar');
    if (statsEl) observer.observe(statsEl);
  }

  // ── News Ticker (continuous horizontal scroll) ──
  (function () {
    var track = document.getElementById('tickerTrack');
    if (!track) return;
    var origItems = Array.from(track.children);
    if (!origItems.length) return;
    // Clone items for seamless loop
    origItems.forEach(function (item) { track.appendChild(item.cloneNode(true)); });
    var pos = 0, running = true, animId;
    var speed = 0.35; // px per frame (~21 px/s at 60fps)
    function getSetWidth() {
      var first = origItems[0], last = origItems[origItems.length - 1];
      return last.getBoundingClientRect().right - first.getBoundingClientRect().left;
    }
    function tick() {
      if (!running) return;
      pos -= speed;
      var setW = getSetWidth();
      if (pos <= -setW) pos += setW;
      track.style.transform = 'translateX(' + pos + 'px)';
      animId = requestAnimationFrame(tick);
    }
    function snap(dir) {
      if (origItems.length < 2) return;
      var step = origItems[1].getBoundingClientRect().left - origItems[0].getBoundingClientRect().left;
      if (!step) return;
      pos += dir === 'next' ? -step : step;
      var setW = getSetWidth();
      if (pos < -setW) pos += setW;
      if (pos > 0) pos -= setW;
    }
    $(track).closest('.news-ticker').find('.ticker-next').on('click', function () { snap('next'); });
    $(track).closest('.news-ticker').find('.ticker-prev').on('click', function () { snap('prev'); });
    animId = requestAnimationFrame(tick);
  })();

  // ── Accordion ──
  $('.accordion-toggle').on('click', function () {
    var $item = $(this).closest('.accordion-item');
    $item.find('.accordion-content').slideToggle(200);
    $item.toggleClass('open');
  });

  // ── Secondary Menu ──
  function hideSecondaryMenu() {
    $('.secondary-menu-panel').removeClass('open');
    $('.secondary-menu-btn i').removeClass('rotate-180');
    setTimeout(function () { $('.secondary-menu-panel').addClass('hidden'); }, 300);
  }
  $('.secondary-menu-btn').on('click', function () {
    $('.secondary-menu-panel').removeClass('hidden').addClass('open');
    $(this).find('i').toggleClass('rotate-180');
  });
  $('.secondary-menu-close').on('click', hideSecondaryMenu);
  $('.secondary-menu-panel').on('click', '.secondary-link', hideSecondaryMenu);
  $(document).on('click', function (e) {
    if ($(e.target).closest('.secondary-menu-panel, .secondary-menu-btn').length === 0 && $('.secondary-menu-panel').hasClass('open')) {
      hideSecondaryMenu();
    }
  });

  // ── Lightbox ──
  if (typeof GLightbox !== 'undefined') {
    GLightbox({ selector: '.glightbox', touchNavigation: true, loop: true, zoomable: true, draggable: true });
  }

  // ── AOS-style scroll animations ──
  if ('IntersectionObserver' in window) {
    var animObserver = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (entry.isIntersecting) {
          entry.target.classList.add('animate-fadeIn');
          animObserver.unobserve(entry.target);
        }
      });
    }, { threshold: 0.15 });
    document.querySelectorAll('.scroll-animate').forEach(function (el) {
      el.style.opacity = '0';
      el.style.transform = 'translateY(30px)';
      el.style.transition = 'all 0.6s cubic-bezier(0.4, 0, 0.2, 1)';
      animObserver.observe(el);
    });
    document.addEventListener('animate-fadeIn', function (e) {
      e.target.style.opacity = '1';
      e.target.style.transform = 'translateY(0)';
    });
    // Simple fallback
    var style = document.createElement('style');
    style.textContent = '.animate-fadeIn { opacity: 1 !important; transform: translateY(0) !important; }';
    document.head.appendChild(style);
  }

});
