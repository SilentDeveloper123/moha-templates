function New-Page {
  param($Filename, $Title, $Desc, $BannerTitle, $BannerDesc, $BreadcrumbHtml, $ContentHtml)

$head = @'
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>__TITLE__</title>
<meta name="description" content="__DESC__">
<script src="https://cdn.tailwindcss.com"></script>
<script>tailwind.config={theme:{extend:{colors:{navy:'#0A1931',green:'#43c000',steel:'#2D5F8A',maroon:'#801200'}}}}</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/glightbox/dist/css/glightbox.min.css">
<link rel="stylesheet" href="css/style.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/mcstudios/glightbox/dist/js/glightbox.min.js"></script>
<script src="js/main.js" defer></script>
</head>
<body class="bg-gray-50 text-gray-800 antialiased">
<div class="page-loader" id="pageLoader">
  <div class="loader-spinner"></div>
  <div class="loader-text">Loading&hellip;</div>
</div>

<!-- ═══ TOPBAR ═══ -->
<div class="topbar text-gray-400 text-[10px] sm:text-xs">
  <div class="max-w-7xl mx-auto px-3 sm:px-6 lg:px-8 flex items-center justify-between h-7 sm:h-9">
    <div class="flex items-center gap-2 sm:gap-3 topbar-contact min-w-0 overflow-hidden">
      <a href="tel:+94112050450" class="flex items-center gap-1 hover:text-green transition-colors shrink-0"><i class="fas fa-phone-alt text-[9px] sm:text-[10px]"></i><span class="topbar-phone">+94 112 050 450</span></a>
      <span class="text-gray-600 shrink-0">|</span>
      <a href="mailto:info@moha.gov.lk" class="flex items-center gap-1 hover:text-green transition-colors shrink-0"><i class="fas fa-envelope text-[10px]"></i><span>info@moha.gov.lk</span></a>
      <span class="text-gray-600 shrink-0 hidden sm:inline">|</span>
      <span class="flex items-center gap-1 text-gray-500 shrink-0 hidden sm:flex"><i class="far fa-clock text-[10px]"></i><span>Mon&ndash;Fri, 8:30 AM &ndash; 4:30 PM</span></span>
    </div>
    <div class="flex items-center gap-0 sm:gap-1 shrink-0">
      <div class="hidden lg:flex items-center gap-1">
        <div class="dropdown-group">
          <a href="information-center.html" class="px-1.5 sm:px-2 py-1 hover:text-green transition-colors flex items-center gap-1"><i class="fas fa-info-circle text-[9px]"></i> <span class="hidden xl:inline">Info Center</span><span class="xl:hidden">Info</span> <i class="fas fa-chevron-down text-[7px] ml-0.5"></i></a>
          <div class="dropdown-menu">
            <a href="circulars.html"><i class="fas fa-file-alt w-4 text-green"></i> Circulars</a>
            <a href="publications.html"><i class="fas fa-book w-4 text-green"></i> Publications</a>
            <a href="government-calendar.html"><i class="far fa-calendar-alt w-4 text-green"></i> Government Calendar</a>
            <a href="vacancies.html"><i class="fas fa-briefcase w-4 text-green"></i> Vacancies</a>
            <a href="downloads.html"><i class="fas fa-download w-4 text-green"></i> Downloads</a>
            <a href="rti.html"><i class="fas fa-scale-balanced w-4 text-green"></i> Right to Information</a>
          </div>
        </div>
        <div class="dropdown-group">
          <a href="reports.html" class="px-1.5 sm:px-2 py-1 hover:text-green transition-colors flex items-center gap-1"><i class="fas fa-chart-bar text-[9px]"></i> Reports <i class="fas fa-chevron-down text-[7px] ml-0.5"></i></a>
          <div class="dropdown-menu">
            <a href="annual-reports.html"><i class="fas fa-file-lines w-4 text-green"></i> Annual Performance Reports</a>
          </div>
        </div>
        <div class="dropdown-group">
          <a href="administrative-services.html" class="px-1.5 sm:px-2 py-1 hover:text-green transition-colors flex items-center gap-1"><i class="fas fa-users-gear text-[9px]"></i> Admin Services <i class="fas fa-chevron-down text-[7px] ml-0.5"></i></a>
          <div class="dropdown-menu">
            <a href="transfer-procedures.html"><i class="fas fa-arrows-rotate w-4 text-green"></i> Transfer Procedures</a>
            <a href="exam-results.html"><i class="fas fa-file-pen w-4 text-green"></i> Exam Results</a>
            <a href="scholarships.html"><i class="fas fa-graduation-cap w-4 text-green"></i> Scholarships</a>
          </div>
        </div>
      </div>
      <a href="special-notices.html" class="px-1.5 sm:px-2 py-1 hover:text-green transition-colors hidden xl:flex items-center gap-1"><i class="fas fa-exclamation-triangle text-[9px]"></i> Special Notices</a>
      <div class="lang-switch flex items-center gap-0.5">
        <a href="#" class="px-1 py-0.5 hover:text-green transition-colors">සිංහල</a>
        <a href="#" class="px-1 py-0.5 hover:text-green transition-colors">தமிழ்</a>
        <span class="bg-green text-white font-bold px-1.5 py-0.5 rounded text-[9px] sm:text-[10px] leading-none cursor-pointer hover:bg-green-600 transition-colors">EN</span>
      </div>
    </div>
  </div>
</div>

<!-- ═══ HEADER / DESKTOP NAV ═══ -->
<header class="bg-white sticky top-0 z-50 shadow-sm border-b border-gray-100 w-full">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="flex items-center justify-between h-16 lg:h-[72px] min-w-0">
      <a href="index.html" class="flex items-center gap-1 sm:gap-3 group min-w-0 shrink lg:shrink-0">
        <img src="https://moha.gov.lk/web/templates/temp-moha/images/new/logo.png" alt="Ministry of Home Affairs" class="h-auto w-36 sm:w-40 lg:w-48 max-w-full">
      </a>
      <nav class="hidden lg:flex items-center gap-0.5">
        <a href="index.html" class="px-3 xl:px-4 py-2 text-sm font-semibold text-gray-700 hover:text-green rounded-lg hover:bg-gray-50 transition-all">Home</a>
        <div class="dropdown-group">
          <a href="about.html" class="px-3 xl:px-4 py-2 text-sm font-semibold text-gray-700 hover:text-green rounded-lg hover:bg-gray-50 transition-all inline-flex items-center gap-1">About <i class="fas fa-chevron-down text-[9px]"></i></a>
          <div class="dropdown-menu">
            <a href="about.html"><i class="fas fa-building w-4 text-green"></i> About the Ministry</a>
            <a href="who-we-are.html"><i class="fas fa-users w-4 text-green"></i> Who We Are</a>
            <a href="governance.html"><i class="fas fa-sitemap w-4 text-green"></i> Governance &amp; Structure</a>
          </div>
        </div>
        <div class="dropdown-group">
          <a href="divisions.html" class="px-3 xl:px-4 py-2 text-sm font-semibold text-gray-700 hover:text-green rounded-lg hover:bg-gray-50 transition-all inline-flex items-center gap-1">Divisions <i class="fas fa-chevron-down text-[9px]"></i></a>
          <div class="dropdown-menu">
            <a href="division-administration.html"><i class="fas fa-building w-4 text-green"></i> Administration</a>
            <a href="division-home-affairs.html"><i class="fas fa-house-chimney w-4 text-green"></i> Home Affairs</a>
            <a href="division-finance.html"><i class="fas fa-coins w-4 text-green"></i> Finance</a>
            <a href="division-planning.html"><i class="fas fa-chart-pie w-4 text-green"></i> Planning</a>
            <a href="division-development.html"><i class="fas fa-leaf w-4 text-green"></i> Development</a>
            <a href="division-engineering.html"><i class="fas fa-gears w-4 text-green"></i> Engineering</a>
            <a href="division-regional-admin-reforms.html"><i class="fas fa-arrows-rotate w-4 text-green"></i> Regional Admin Reforms</a>
            <a href="division-internal-audit.html"><i class="fas fa-file-invoice w-4 text-green"></i> Internal Audit</a>
            <a href="division-investigation.html"><i class="fas fa-magnifying-glass w-4 text-green"></i> Investigation</a>
          </div>
        </div>
        <div class="dropdown-group">
          <a href="institutions.html" class="px-3 xl:px-4 py-2 text-sm font-semibold text-gray-700 hover:text-green rounded-lg hover:bg-gray-50 transition-all inline-flex items-center gap-1">Institutions <i class="fas fa-chevron-down text-[9px]"></i></a>
          <div class="dropdown-menu">
            <a href="district-secretariats.html"><i class="fas fa-building-columns w-4 text-green"></i> District Secretariats</a>
            <a href="divisional-secretariats.html"><i class="fas fa-building w-4 text-green"></i> Divisional Secretariats</a>
            <a href="grama-niladhari.html"><i class="fas fa-house-chimney w-4 text-green"></i> Grama Niladhari Offices</a>
            <a href="registrar-general.html"><i class="fas fa-file-contract w-4 text-green"></i> Dept. of Registrar General</a>
          </div>
        </div>
        <a href="services.html" class="px-3 xl:px-4 py-2 text-sm font-semibold text-gray-700 hover:text-green rounded-lg hover:bg-gray-50 transition-all">Services</a>
        <a href="news.html" class="px-3 xl:px-4 py-2 text-sm font-semibold text-gray-700 hover:text-green rounded-lg hover:bg-gray-50 transition-all">News</a>
        <a href="contact.html" class="px-3 xl:px-4 py-2 text-sm font-semibold text-gray-700 hover:text-green rounded-lg hover:bg-gray-50 transition-all">Contact</a>
        <a href="circuit-bungalow.html" class="bg-green text-white font-bold px-5 py-2.5 rounded-lg text-sm hover:bg-green-600 transition-all ml-2 shadow-sm hover:shadow-md flex items-center gap-2"><i class="fas fa-calendar-check"></i> Circuit Booking</a>
      </nav>
      <div class="flex lg:hidden items-center gap-1.5">
        <a href="circuit-bungalow.html" class="bg-green text-white font-bold px-3 py-1.5 rounded-lg text-[11px] hover:bg-green-600 transition-all flex items-center gap-1.5 shadow-sm"><i class="fas fa-calendar-check text-[10px]"></i><span>Circuit Booking</span></a>
        <div class="hamburger flex flex-col items-center justify-center gap-1.5 cursor-pointer p-2 hover:bg-gray-100 rounded-lg transition-colors">
          <span class="w-6 h-[2px] bg-navy rounded shrink-0"></span>
          <span class="w-6 h-[2px] bg-navy rounded shrink-0"></span>
          <span class="w-6 h-[2px] bg-navy rounded shrink-0"></span>
        </div>
      </div>
    </div>
  </div>
</header>

<!-- ═══ MOBILE NAV (Accordion) ═══ -->
<div class="nav-mobile fixed inset-0 z-[100] hidden">
  <button class="close-btn absolute top-5 right-5 text-white text-3xl bg-transparent border-0 cursor-pointer hover:text-green transition-colors z-10"><i class="fas fa-times"></i></button>
  <div class="h-full overflow-y-auto px-4 py-20 w-full">
    <div class="nav-links w-full">
      <a href="index.html" class="flex items-center gap-3 text-white text-base font-semibold py-3 px-4 rounded-lg hover:bg-white/10 transition-colors"><i class="fas fa-house w-5 text-green text-center"></i> Home</a>
      <div class="accordion-item">
        <button class="accordion-toggle flex items-center justify-between w-full text-white text-base font-semibold py-3 px-4 rounded-lg hover:bg-white/10 transition-colors">
          <span class="flex items-center gap-3"><i class="fas fa-info-circle w-5 text-green text-center"></i> About Us</span>
          <i class="fas fa-chevron-down text-xs transition-transform duration-300"></i>
        </button>
        <div class="accordion-content hidden">
          <a href="about.html" class="block text-white/70 text-sm py-2 pl-14 pr-4 rounded-lg hover:text-white hover:bg-white/5 transition-colors"><i class="fas fa-chevron-right w-3 text-green mr-2"></i>Who We Are</a>
          <a href="the-ministry.html" class="block text-white/70 text-sm py-2 pl-14 pr-4 rounded-lg hover:text-white hover:bg-white/5 transition-colors"><i class="fas fa-chevron-right w-3 text-green mr-2"></i>The Ministry</a>
          <a href="governance.html" class="block text-white/70 text-sm py-2 pl-14 pr-4 rounded-lg hover:text-white hover:bg-white/5 transition-colors"><i class="fas fa-chevron-right w-3 text-green mr-2"></i>Governance &amp; Structure</a>
        </div>
      </div>
      <div class="accordion-item">
        <button class="accordion-toggle flex items-center justify-between w-full text-white text-base font-semibold py-3 px-4 rounded-lg hover:bg-white/10 transition-colors">
          <span class="flex items-center gap-3"><i class="fas fa-sitemap w-5 text-green text-center"></i> Divisions</span>
          <i class="fas fa-chevron-down text-xs transition-transform duration-300"></i>
        </button>
        <div class="accordion-content hidden">
          <a href="division-administration.html" class="block text-white/70 text-sm py-2 pl-14 pr-4 rounded-lg hover:text-white hover:bg-white/5 transition-colors"><i class="fas fa-chevron-right w-3 text-green mr-2"></i>Administration</a>
          <a href="division-home-affairs.html" class="block text-white/70 text-sm py-2 pl-14 pr-4 rounded-lg hover:text-white hover:bg-white/5 transition-colors"><i class="fas fa-chevron-right w-3 text-green mr-2"></i>Home Affairs</a>
          <a href="division-finance.html" class="block text-white/70 text-sm py-2 pl-14 pr-4 rounded-lg hover:text-white hover:bg-white/5 transition-colors"><i class="fas fa-chevron-right w-3 text-green mr-2"></i>Finance</a>
          <a href="division-planning.html" class="block text-white/70 text-sm py-2 pl-14 pr-4 rounded-lg hover:text-white hover:bg-white/5 transition-colors"><i class="fas fa-chevron-right w-3 text-green mr-2"></i>Planning</a>
          <a href="division-development.html" class="block text-white/70 text-sm py-2 pl-14 pr-4 rounded-lg hover:text-white hover:bg-white/5 transition-colors"><i class="fas fa-chevron-right w-3 text-green mr-2"></i>Development</a>
          <a href="division-engineering.html" class="block text-white/70 text-sm py-2 pl-14 pr-4 rounded-lg hover:text-white hover:bg-white/5 transition-colors"><i class="fas fa-chevron-right w-3 text-green mr-2"></i>Engineering</a>
          <a href="division-regional-admin-reforms.html" class="block text-white/70 text-sm py-2 pl-14 pr-4 rounded-lg hover:text-white hover:bg-white/5 transition-colors"><i class="fas fa-chevron-right w-3 text-green mr-2"></i>Regional Admin Reforms</a>
          <a href="division-internal-audit.html" class="block text-white/70 text-sm py-2 pl-14 pr-4 rounded-lg hover:text-white hover:bg-white/5 transition-colors"><i class="fas fa-chevron-right w-3 text-green mr-2"></i>Internal Audit</a>
          <a href="division-investigation.html" class="block text-white/70 text-sm py-2 pl-14 pr-4 rounded-lg hover:text-white hover:bg-white/5 transition-colors"><i class="fas fa-chevron-right w-3 text-green mr-2"></i>Investigation</a>
        </div>
      </div>
      <div class="accordion-item">
        <button class="accordion-toggle flex items-center justify-between w-full text-white text-base font-semibold py-3 px-4 rounded-lg hover:bg-white/10 transition-colors">
          <span class="flex items-center gap-3"><i class="fas fa-landmark w-5 text-green text-center"></i> Institutions</span>
          <i class="fas fa-chevron-down text-xs transition-transform duration-300"></i>
        </button>
        <div class="accordion-content hidden">
          <a href="district-secretariats.html" class="block text-white/70 text-sm py-2 pl-14 pr-4 rounded-lg hover:text-white hover:bg-white/5 transition-colors"><i class="fas fa-chevron-right w-3 text-green mr-2"></i>District Secretariats</a>
          <a href="divisional-secretariats.html" class="block text-white/70 text-sm py-2 pl-14 pr-4 rounded-lg hover:text-white hover:bg-white/5 transition-colors"><i class="fas fa-chevron-right w-3 text-green mr-2"></i>Divisional Secretariats</a>
          <a href="grama-niladhari.html" class="block text-white/70 text-sm py-2 pl-14 pr-4 rounded-lg hover:text-white hover:bg-white/5 transition-colors"><i class="fas fa-chevron-right w-3 text-green mr-2"></i>Grama Niladhari Offices</a>
          <a href="registrar-general.html" class="block text-white/70 text-sm py-2 pl-14 pr-4 rounded-lg hover:text-white hover:bg-white/5 transition-colors"><i class="fas fa-chevron-right w-3 text-green mr-2"></i>Dept. of Registrar General</a>
        </div>
      </div>
      <div class="accordion-item">
        <button class="accordion-toggle flex items-center justify-between w-full text-white text-base font-semibold py-3 px-4 rounded-lg hover:bg-white/10 transition-colors">
          <span class="flex items-center gap-3"><i class="fas fa-building-columns w-5 text-green text-center"></i> Services</span>
          <i class="fas fa-chevron-down text-xs transition-transform duration-300"></i>
        </button>
        <div class="accordion-content hidden">
          <a href="services.html" class="block text-white/70 text-sm py-2 pl-14 pr-4 rounded-lg hover:text-white hover:bg-white/5 transition-colors"><i class="fas fa-chevron-right w-3 text-green mr-2"></i>All Services</a>
          <a href="e-services.html" class="block text-white/70 text-sm py-2 pl-14 pr-4 rounded-lg hover:text-white hover:bg-white/5 transition-colors"><i class="fas fa-chevron-right w-3 text-green mr-2"></i>E-Services</a>
          <a href="circuit-bungalow.html" class="block text-white/70 text-sm py-2 pl-14 pr-4 rounded-lg hover:text-white hover:bg-white/5 transition-colors"><i class="fas fa-chevron-right w-3 text-green mr-2"></i>Circuit Bungalow Booking</a>
        </div>
      </div>
      <a href="news.html" class="flex items-center gap-3 text-white text-base font-semibold py-3 px-4 rounded-lg hover:bg-white/10 transition-colors"><i class="far fa-newspaper w-5 text-green text-center"></i> News</a>
      <a href="contact.html" class="flex items-center gap-3 text-white text-base font-semibold py-3 px-4 rounded-lg hover:bg-white/10 transition-colors"><i class="fas fa-headset w-5 text-green text-center"></i> Contact</a>
    </div>
  </div>
</div>

<!-- ═══ NEWS TICKER ═══ -->
<div class="news-ticker border-b border-gray-100">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex items-center h-10">
    <span class="bg-green text-white text-[10px] font-bold uppercase tracking-wider px-2.5 py-1 rounded mr-3 shrink-0 flex items-center gap-1"><i class="fas fa-bolt text-[8px]"></i> Breaking</span>
    <div class="overflow-hidden flex-1 relative h-full">
      <div class="ticker-track text-xs font-medium text-gray-700" id="tickerTrack">
        <span class="ticker-item flex items-center gap-2"><i class="fas fa-circle text-[4px] text-green"></i> 78th National Independence Day celebrated at Independence Square</span>
        <span class="ticker-item flex items-center gap-2"><i class="fas fa-circle text-[4px] text-green"></i> Digital Signature System launched for secure document verification</span>
        <span class="ticker-item flex items-center gap-2"><i class="fas fa-circle text-[4px] text-green"></i> Island-wide Grama Niladhari training programme commences next month</span>
        <span class="ticker-item flex items-center gap-2"><i class="fas fa-circle text-[4px] text-green"></i> Online Circuit Bungalow Booking system now available 24/7</span>
        <span class="ticker-item flex items-center gap-2"><i class="fas fa-circle text-[4px] text-green"></i> New public administration reforms to be implemented from Q3 2025</span>
        <span class="ticker-item flex items-center gap-2"><i class="fas fa-circle text-[4px] text-green"></i> E-Visa system launched for 30 countries to boost tourism and trade</span>
        <span class="ticker-item flex items-center gap-2"><i class="fas fa-circle text-[4px] text-green"></i> Freehold land deeds to be issued for 100,000 families island-wide</span>
        <span class="ticker-item flex items-center gap-2"><i class="fas fa-circle text-[4px] text-green"></i> Online passport renewal service expanded to all district secretariats</span>
        <span class="ticker-item flex items-center gap-2"><i class="fas fa-circle text-[4px] text-green"></i> National Digital Identity card pilot project to begin next quarter</span>
        <span class="ticker-item flex items-center gap-2"><i class="fas fa-circle text-[4px] text-green"></i> Special disaster relief fund of Rs. 5 billion approved by Cabinet</span>
      </div>
    </div>
    <div class="ticker-nav flex items-center gap-0.5 ml-2 shrink-0">
      <button class="ticker-prev w-5 h-5 flex items-center justify-center rounded-full bg-gray-100 hover:bg-green hover:text-white transition-all text-[9px] text-gray-500" aria-label="Previous"><i class="fas fa-chevron-left"></i></button>
      <button class="ticker-next w-5 h-5 flex items-center justify-center rounded-full bg-gray-100 hover:bg-green hover:text-white transition-all text-[9px] text-gray-500" aria-label="Next"><i class="fas fa-chevron-right"></i></button>
    </div>
  </div>
</div>
'@

$foot = @'
<footer class="bg-gray-900 text-gray-400 border-t border-white/5">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12 sm:py-16 lg:py-20 grid sm:grid-cols-2 lg:grid-cols-4 gap-8 sm:gap-10 lg:gap-16">
    <div>
      <div class="flex items-center gap-3 mb-5">
        <div class="w-10 h-10 bg-green rounded-xl flex items-center justify-center text-white"><i class="fas fa-landmark"></i></div>
        <strong class="text-white text-base">Ministry of Home Affairs</strong>
      </div>
      <p class="text-sm leading-relaxed mb-5 text-gray-500">&ldquo;Nila Madura&rdquo;, Independence Square,<br>Colombo 07, Sri Lanka.</p>
      <div class="space-y-2.5 text-sm">
        <a href="tel:+94112050450" class="flex items-center gap-3 hover:text-green transition-colors"><i class="fas fa-phone w-4 text-green"></i> +94 112 050 450</a>
        <a href="mailto:info@moha.gov.lk" class="flex items-center gap-3 hover:text-green transition-colors"><i class="fas fa-envelope w-4 text-green"></i> info@moha.gov.lk</a>
        <span class="flex items-center gap-3"><i class="fas fa-globe w-4 text-green"></i> www.moha.gov.lk</span>
      </div>
      <div class="flex gap-3 mt-6">
        <a href="#" class="social-icon w-9 h-9 rounded-full border border-white/10 flex items-center justify-center text-xs text-gray-400 hover:bg-green hover:text-white hover:border-green transition-all"><i class="fab fa-facebook-f"></i></a>
        <a href="#" class="social-icon w-9 h-9 rounded-full border border-white/10 flex items-center justify-center text-xs text-gray-400 hover:bg-green hover:text-white hover:border-green transition-all"><i class="fab fa-twitter"></i></a>
        <a href="#" class="social-icon w-9 h-9 rounded-full border border-white/10 flex items-center justify-center text-xs text-gray-400 hover:bg-green hover:text-white hover:border-green transition-all"><i class="fab fa-youtube"></i></a>
        <a href="#" class="social-icon w-9 h-9 rounded-full border border-white/10 flex items-center justify-center text-xs text-gray-400 hover:bg-green hover:text-white hover:border-green transition-all"><i class="fab fa-linkedin-in"></i></a>
      </div>
    </div>
    <div>
      <h4 class="text-white text-xs font-bold uppercase tracking-wider mb-6">Related Links</h4>
      <ul class="space-y-3 text-sm">
        <li><a href="https://www.presidentsoffice.gov.lk/" target="_blank" class="hover:text-green transition-colors flex items-center gap-2"><i class="fas fa-chevron-right text-[8px] text-green"></i> President of Sri Lanka</a></li>
        <li><a href="https://www.presidentsoffice.gov.lk/" target="_blank" class="hover:text-green transition-colors flex items-center gap-2"><i class="fas fa-chevron-right text-[8px] text-green"></i> President&rsquo;s Secretariats</a></li>
        <li><a href="https://www.pmoffice.gov.lk/" target="_blank" class="hover:text-green transition-colors flex items-center gap-2"><i class="fas fa-chevron-right text-[8px] text-green"></i> Prime Minister&rsquo;s Office</a></li>
        <li><a href="https://www.pubad.gov.lk/" target="_blank" class="hover:text-green transition-colors flex items-center gap-2"><i class="fas fa-chevron-right text-[8px] text-green"></i> Ministry of Public Services, Provincial Councils and Local Government</a></li>
        <li><a href="https://www.immigration.gov.lk/" target="_blank" class="hover:text-green transition-colors flex items-center gap-2"><i class="fas fa-chevron-right text-[8px] text-green"></i> Department of Immigration and Emigration</a></li>
        <li><a href="https://www.treasury.gov.lk/" target="_blank" class="hover:text-green transition-colors flex items-center gap-2"><i class="fas fa-chevron-right text-[8px] text-green"></i> Ministry of Finance</a></li>
        <li><a href="related-links.html" class="hover:text-green transition-colors flex items-center gap-2"><i class="fas fa-chevron-right text-[8px] text-green"></i> More Links</a></li>
      </ul>
    </div>
    <div class="sm:col-span-2 lg:col-span-2">
      <div class="grid sm:grid-cols-2 gap-6">
        <div>
          <h4 class="text-white text-xs font-bold uppercase tracking-wider mb-6">Quick Inquiry</h4>
          <form action="contact.html" method="get" class="space-y-3">
            <input type="text" name="name" placeholder="Your Name" class="w-full bg-white/[0.06] border border-white/10 rounded-lg px-3.5 py-2.5 text-sm text-white placeholder-gray-500 focus:outline-none focus:border-green transition-colors">
            <input type="email" name="email" placeholder="Email Address" class="w-full bg-white/[0.06] border border-white/10 rounded-lg px-3.5 py-2.5 text-sm text-white placeholder-gray-500 focus:outline-none focus:border-green transition-colors">
            <textarea name="message" rows="2" placeholder="Your Message" class="w-full bg-white/[0.06] border border-white/10 rounded-lg px-3.5 py-2.5 text-sm text-white placeholder-gray-500 focus:outline-none focus:border-green transition-colors resize-none"></textarea>
            <button type="submit" class="bg-green text-white font-bold px-5 py-2.5 rounded-lg text-xs hover:bg-green-600 transition-all w-full flex items-center justify-center gap-2"><i class="fas fa-paper-plane"></i> Send Message</button>
          </form>
        </div>
        <div>
          <h4 class="text-white text-xs font-bold uppercase tracking-wider mb-6">Find Us</h4>
          <div class="rounded-xl overflow-hidden border border-white/10">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3960.798473103073!2d79.861!3d6.913!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae2596f100ebf2d%3A0xafa2d6c7f09bc63!2sIndependence%20Square!5e0!3m2!1sen!2slk!4v1" width="100%" height="180" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
          </div>
          <div class="mt-5 space-y-2 text-sm">
            <div class="flex items-center gap-3 text-gray-400"><i class="fas fa-clock w-4 text-green"></i><span>Mon &ndash; Fri: 8:30 AM &ndash; 4:30 PM</span></div>
            <div class="flex items-center gap-3 text-gray-400"><i class="fas fa-clock w-4 text-green"></i><span>Sat &ndash; Sun: Closed</span></div>
            <div class="flex items-center gap-3 text-gray-400"><i class="fas fa-calendar-alt w-4 text-green"></i><span>Public Holidays: Closed</span></div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="border-t border-white/5">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-5 flex flex-col sm:flex-row justify-between items-center gap-3 text-xs text-gray-500">
      <span>&copy; 2025 Ministry of Home Affairs, Public Administration &amp; Disaster Management &mdash; Sri Lanka. All Rights Reserved.</span>
      <span class="flex items-center gap-3">
        <a href="privacy-policy.html" class="hover:text-green transition-colors">Privacy Policy</a>
        <span class="text-gray-700">&middot;</span>
        <a href="terms-of-use.html" class="hover:text-green transition-colors">Terms of Use</a>
        <span class="text-gray-700">&middot;</span>
        <a href="accessibility.html" class="hover:text-green transition-colors">Accessibility</a>
      </span>
    </div>
  </div>
</footer>

</body>
</html>
'@

  $html = $head.Replace('__TITLE__', $Title).Replace('__DESC__', $Desc)
  $html += $ContentHtml
  $html += $foot
  [IO.File]::WriteAllText((Join-Path (Get-Location) $Filename), $html, [Text.Encoding]::UTF8)
  Write-Host "  Created: $Filename"
}

# ============================================================
# Generate all WordPress Template Hierarchy pages
# ============================================================

$dir = Split-Path -Parent $PSCommandPath
Set-Location -LiteralPath $dir

Write-Host "Generating WordPress template pages..."

# 1. front-page.html
New-Page -Filename "front-page.html" -Title "Front Page - Ministry of Home Affairs, Sri Lanka" -Desc "Official front page of the Ministry of Home Affairs, Public Administration and Disaster Management - Sri Lanka." -ContentHtml @'
<section class="hero-slider">
  <div class="slide-bg active" style="background-image: url('https://placehold.co/1600x900/1a3a6a/ffffff.png')"></div>
  <div class="slide-bg" style="background-image: url('https://placehold.co/1600x900/2D5F8A/ffffff.png')"></div>
  <div class="slide-overlay"></div>
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16 sm:py-20 lg:py-28 relative z-10">
    <div class="flex flex-col lg:flex-row gap-8 sm:gap-12 lg:gap-20 items-start">
      <div class="flex-1 min-w-0">
        <div class="hero-slides relative">
          <div class="hero-slide active">
            <div class="inline-flex items-center gap-2 bg-green/20 text-green text-[11px] font-bold tracking-wider uppercase px-3 py-1.5 rounded-full mb-5 sm:mb-6 backdrop-blur-sm border border-green/20">
              <i class="fas fa-crown text-[10px]"></i> Official Government Portal
            </div>
            <h1 class="text-3xl sm:text-5xl lg:text-6xl font-extrabold text-white leading-[1.1] mb-4 sm:mb-5">Serving the People<br>of <span class="text-green">Sri Lanka</span></h1>
            <p class="text-sm sm:text-base lg:text-lg text-white/70 max-w-xl mx-auto lg:mx-0 mb-6 sm:mb-8 leading-relaxed">Delivering transparent governance and public services across all 25 districts.</p>
            <div class="flex gap-3 justify-center lg:justify-start flex-wrap">
              <a href="services.html" class="bg-green text-white font-bold px-6 sm:px-7 py-3 rounded-xl text-xs sm:text-sm inline-flex items-center gap-2 hover:bg-green-600 transition-all shadow-lg shadow-green/25"><i class="fas fa-arrow-right"></i> Explore Services</a>
              <a href="circuit-bungalow.html" class="border-2 border-white/25 text-white font-semibold px-6 sm:px-7 py-3 rounded-xl text-xs sm:text-sm inline-flex items-center gap-2 hover:bg-white/10 transition-all backdrop-blur-sm"><i class="fas fa-calendar-check"></i> Book Bungalow</a>
            </div>
          </div>
        </div>
        <div class="flex items-center gap-2.5 mt-6 sm:mt-8">
          <span class="hero-dot active w-2.5 h-2.5 rounded-full bg-white cursor-pointer"></span>
          <span class="hero-dot w-2.5 h-2.5 rounded-full bg-white/40 cursor-pointer"></span>
          <span class="hero-dot w-2.5 h-2.5 rounded-full bg-white/40 cursor-pointer"></span>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="py-14 lg:py-20 bg-gray-50">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="text-center mb-12">
      <span class="inline-flex items-center gap-2 text-green font-bold text-xs tracking-[2px] uppercase bg-green/10 px-3 py-1.5 rounded-full mb-4">Our Services</span>
      <h2 class="text-3xl sm:text-4xl lg:text-5xl font-extrabold text-navy mt-2">Quick Access</h2>
    </div>
    <div class="grid md:grid-cols-3 gap-6">
      <a href="services.html" class="block bg-white border border-gray-100 rounded-2xl p-6 card-top-line card-hover">
        <div class="w-12 h-12 bg-green/10 rounded-xl flex items-center justify-center text-xl mb-4"><i class="fas fa-users text-green"></i></div>
        <h3 class="text-base font-bold text-navy mb-2">Public Services</h3>
        <p class="text-sm text-gray-400 leading-relaxed">Access government services, applications, and information.</p>
      </a>
      <a href="circuit-bungalow.html" class="block bg-white border border-gray-100 rounded-2xl p-6 card-top-line card-hover">
        <div class="w-12 h-12 bg-green/10 rounded-xl flex items-center justify-center text-xl mb-4"><i class="fas fa-house-chimney text-green"></i></div>
        <h3 class="text-base font-bold text-navy mb-2">Circuit Bungalows</h3>
        <p class="text-sm text-gray-400 leading-relaxed">Book government circuit bungalows online 24/7.</p>
      </a>
      <a href="news.html" class="block bg-white border border-gray-100 rounded-2xl p-6 card-top-line card-hover">
        <div class="w-12 h-12 bg-green/10 rounded-xl flex items-center justify-center text-xl mb-4"><i class="fas fa-newspaper text-green"></i></div>
        <h3 class="text-base font-bold text-navy mb-2">News &amp; Updates</h3>
        <p class="text-sm text-gray-400 leading-relaxed">Stay informed with the latest announcements and press releases.</p>
      </a>
    </div>
  </div>
</section>

<section class="bg-navy py-14 lg:py-20">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
    <h2 class="text-3xl sm:text-4xl font-extrabold text-white mb-4">Welcome to the Ministry</h2>
    <p class="text-white/60 max-w-2xl mx-auto text-lg mb-8">Dedicated to serving the nation through transparent, efficient, and citizen-centered public administration.</p>
    <div class="flex gap-4 justify-center flex-wrap">
      <a href="about.html" class="bg-green text-white font-bold px-7 py-3.5 rounded-xl text-sm hover:bg-green-600 transition-all shadow-lg shadow-green/25 inline-flex items-center gap-2">Learn More <i class="fas fa-arrow-right"></i></a>
      <a href="contact.html" class="bg-white/10 text-white font-semibold px-7 py-3.5 rounded-xl text-sm hover:bg-white/20 transition-all inline-flex items-center gap-2 border border-white/20"><i class="fas fa-envelope"></i> Contact Us</a>
    </div>
  </div>
</section>
'@

# 2. home.html
New-Page -Filename "home.html" -Title "Home - Ministry of Home Affairs, Sri Lanka" -Desc "Latest news, updates, and announcements from the Ministry of Home Affairs, Sri Lanka." -ContentHtml @'
<div class="banner-page relative overflow-hidden">
  <img src="https://placehold.co/1600x600/1a3a6a/2D5F8A?text=Latest+News+and+Updates" alt="" class="absolute inset-0 w-full h-full object-cover z-[1]">
  <div class="absolute inset-0 bg-gradient-to-r from-navy/80 via-navy/60 to-steel/50 z-[2]"></div>
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-14 lg:py-20 relative z-10">
    <div class="flex items-center gap-2 text-xs text-white/40 mb-4">
      <a href="index.html" class="hover:text-green transition-colors"><i class="fas fa-house-chimney mr-1"></i>Home</a>
      <i class="fas fa-chevron-right text-[8px]"></i>
      <span class="text-green font-medium">Latest News &amp; Updates</span>
    </div>
    <h1 class="text-3xl lg:text-5xl font-extrabold text-white mb-3">Latest News &amp; Updates</h1>
    <p class="text-white/60 max-w-2xl text-base leading-relaxed">Stay informed with the latest news, press releases, and official announcements.</p>
  </div>
</div>

<section class="py-14 lg:py-20 bg-gray-50">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="grid lg:grid-cols-3 gap-12">
      <div class="lg:col-span-2 space-y-8">
        <div class="grid sm:grid-cols-2 gap-6">
          <article class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden hover:shadow-md transition-all group"><div class="relative overflow-hidden"><img src="https://placehold.co/600x350/1a3a6a/FFFFFF?text=Independence+Day" alt="" class="w-full h-48 object-cover group-hover:scale-105 transition-transform duration-500"><span class="absolute top-3 left-3 bg-green text-white text-[10px] font-bold uppercase tracking-wider px-2.5 py-1 rounded">Press Release</span></div><div class="p-5"><div class="flex items-center gap-3 text-[11px] text-gray-400 mb-3"><span><i class="far fa-calendar-alt mr-1 text-green"></i> June 12, 2025</span><span><i class="far fa-folder-open mr-1 text-green"></i> Events</span></div><h3 class="font-bold text-navy text-base mb-2 group-hover:text-green transition-colors leading-snug">78th National Independence Day Celebrated</h3><p class="text-gray-400 text-sm leading-relaxed">The Ministry coordinated the 78th Independence Day celebrations with full state honors and cultural performances.</p><a href="single.html" class="mt-4 text-green text-sm font-semibold inline-flex items-center gap-1.5 hover:gap-2.5 transition-all">Read More <i class="fas fa-arrow-right text-[10px]"></i></a></div></article>
          <article class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden hover:shadow-md transition-all group"><div class="relative overflow-hidden"><img src="https://placehold.co/600x350/2D5F8A/FFFFFF?text=Digital+Signature" alt="" class="w-full h-48 object-cover group-hover:scale-105 transition-transform duration-500"><span class="absolute top-3 left-3 bg-maroon text-white text-[10px] font-bold uppercase tracking-wider px-2.5 py-1 rounded">Announcement</span></div><div class="p-5"><div class="flex items-center gap-3 text-[11px] text-gray-400 mb-3"><span><i class="far fa-calendar-alt mr-1 text-green"></i> June 8, 2025</span><span><i class="far fa-folder-open mr-1 text-green"></i> Digital</span></div><h3 class="font-bold text-navy text-base mb-2 group-hover:text-green transition-colors leading-snug">Digital Signature System Launched</h3><p class="text-gray-400 text-sm leading-relaxed">New digital signature platform for secure document verification across all government institutions.</p><a href="single.html" class="mt-4 text-green text-sm font-semibold inline-flex items-center gap-1.5 hover:gap-2.5 transition-all">Read More <i class="fas fa-arrow-right text-[10px]"></i></a></div></article>
          <article class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden hover:shadow-md transition-all group"><div class="relative overflow-hidden"><img src="https://placehold.co/600x350/801200/FFFFFF?text=Grama+Niladhari" alt="" class="w-full h-48 object-cover group-hover:scale-105 transition-transform duration-500"><span class="absolute top-3 left-3 bg-green text-white text-[10px] font-bold uppercase tracking-wider px-2.5 py-1 rounded">Training</span></div><div class="p-5"><div class="flex items-center gap-3 text-[11px] text-gray-400 mb-3"><span><i class="far fa-calendar-alt mr-1 text-green"></i> June 5, 2025</span><span><i class="far fa-folder-open mr-1 text-green"></i> Development</span></div><h3 class="font-bold text-navy text-base mb-2 group-hover:text-green transition-colors leading-snug">Grama Niladhari Training Programme</h3><p class="text-gray-400 text-sm leading-relaxed">Island-wide training programme for Grama Niladhari officers commencing next month.</p><a href="single.html" class="mt-4 text-green text-sm font-semibold inline-flex items-center gap-1.5 hover:gap-2.5 transition-all">Read More <i class="fas fa-arrow-right text-[10px]"></i></a></div></article>
          <article class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden hover:shadow-md transition-all group"><div class="relative overflow-hidden"><img src="https://placehold.co/600x350/0A1931/FFFFFF?text=Circuit+Bungalow" alt="" class="w-full h-48 object-cover group-hover:scale-105 transition-transform duration-500"><span class="absolute top-3 left-3 bg-maroon text-white text-[10px] font-bold uppercase tracking-wider px-2.5 py-1 rounded">Service</span></div><div class="p-5"><div class="flex items-center gap-3 text-[11px] text-gray-400 mb-3"><span><i class="far fa-calendar-alt mr-1 text-green"></i> May 28, 2025</span><span><i class="far fa-folder-open mr-1 text-green"></i> Digital</span></div><h3 class="font-bold text-navy text-base mb-2 group-hover:text-green transition-colors leading-snug">Circuit Bungalow Booking 24/7</h3><p class="text-gray-400 text-sm leading-relaxed">New online booking system for circuit bungalows now operational around the clock.</p><a href="single.html" class="mt-4 text-green text-sm font-semibold inline-flex items-center gap-1.5 hover:gap-2.5 transition-all">Read More <i class="fas fa-arrow-right text-[10px]"></i></a></div></article>
          <article class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden hover:shadow-md transition-all group"><div class="relative overflow-hidden"><img src="https://placehold.co/600x350/2D5F8A/FFFFFF?text=Admin+Reforms" alt="" class="w-full h-48 object-cover group-hover:scale-105 transition-transform duration-500"><span class="absolute top-3 left-3 bg-green text-white text-[10px] font-bold uppercase tracking-wider px-2.5 py-1 rounded">Policy</span></div><div class="p-5"><div class="flex items-center gap-3 text-[11px] text-gray-400 mb-3"><span><i class="far fa-calendar-alt mr-1 text-green"></i> May 20, 2025</span><span><i class="far fa-folder-open mr-1 text-green"></i> Reforms</span></div><h3 class="font-bold text-navy text-base mb-2 group-hover:text-green transition-colors leading-snug">Public Admin Reforms Q3 2025</h3><p class="text-gray-400 text-sm leading-relaxed">Comprehensive reforms to improve efficiency and service delivery across all divisions.</p><a href="single.html" class="mt-4 text-green text-sm font-semibold inline-flex items-center gap-1.5 hover:gap-2.5 transition-all">Read More <i class="fas fa-arrow-right text-[10px]"></i></a></div></article>
          <article class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden hover:shadow-md transition-all group"><div class="relative overflow-hidden"><img src="https://placehold.co/600x350/801200/FFFFFF?text=E-Visa+System" alt="" class="w-full h-48 object-cover group-hover:scale-105 transition-transform duration-500"><span class="absolute top-3 left-3 bg-maroon text-white text-[10px] font-bold uppercase tracking-wider px-2.5 py-1 rounded">Announcement</span></div><div class="p-5"><div class="flex items-center gap-3 text-[11px] text-gray-400 mb-3"><span><i class="far fa-calendar-alt mr-1 text-green"></i> May 15, 2025</span><span><i class="far fa-folder-open mr-1 text-green"></i> Digital</span></div><h3 class="font-bold text-navy text-base mb-2 group-hover:text-green transition-colors leading-snug">E-Visa System for 30 Countries</h3><p class="text-gray-400 text-sm leading-relaxed">New electronic visa system launched to boost tourism and business travel to Sri Lanka.</p><a href="single.html" class="mt-4 text-green text-sm font-semibold inline-flex items-center gap-1.5 hover:gap-2.5 transition-all">Read More <i class="fas fa-arrow-right text-[10px]"></i></a></div></article>
        </div>
        <div class="pagination flex items-center justify-center gap-1.5 pt-8 border-t border-gray-100">
          <a href="#" class="px-3 py-2 text-xs font-semibold text-gray-400 border border-gray-200 rounded-lg hover:border-green hover:text-green transition-all">&laquo;</a>
          <a href="#" class="px-3 py-2 text-xs font-semibold border border-gray-200 rounded-lg bg-green text-white border-green">1</a>
          <a href="#" class="px-3 py-2 text-xs font-semibold text-gray-600 border border-gray-200 rounded-lg hover:border-green hover:text-green transition-all">2</a>
          <a href="#" class="px-3 py-2 text-xs font-semibold text-gray-600 border border-gray-200 rounded-lg hover:border-green hover:text-green transition-all">3</a>
          <a href="#" class="px-3 py-2 text-xs font-semibold text-gray-400 border border-gray-200 rounded-lg hover:border-green hover:text-green transition-all">&raquo;</a>
        </div>
      </div>
      <aside class="space-y-8">
        <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6">
          <h3 class="font-bold text-navy text-sm mb-4 uppercase tracking-wider">Categories</h3>
          <ul class="space-y-2 text-sm">
            <li><a href="category.html" class="flex items-center justify-between text-gray-500 hover:text-green transition-colors px-3 py-2 rounded-lg hover:bg-gray-50"><span>Press Releases</span><span class="bg-gray-100 text-gray-400 text-[10px] font-bold px-2 py-0.5 rounded-full">12</span></a></li>
            <li><a href="category.html" class="flex items-center justify-between text-gray-500 hover:text-green transition-colors px-3 py-2 rounded-lg hover:bg-gray-50"><span>Announcements</span><span class="bg-gray-100 text-gray-400 text-[10px] font-bold px-2 py-0.5 rounded-full">8</span></a></li>
            <li><a href="category.html" class="flex items-center justify-between text-gray-500 hover:text-green transition-colors px-3 py-2 rounded-lg hover:bg-gray-50"><span>Events</span><span class="bg-gray-100 text-gray-400 text-[10px] font-bold px-2 py-0.5 rounded-full">6</span></a></li>
            <li><a href="category.html" class="flex items-center justify-between text-gray-500 hover:text-green transition-colors px-3 py-2 rounded-lg hover:bg-gray-50"><span>Circulars</span><span class="bg-gray-100 text-gray-400 text-[10px] font-bold px-2 py-0.5 rounded-full">24</span></a></li>
            <li><a href="category.html" class="flex items-center justify-between text-gray-500 hover:text-green transition-colors px-3 py-2 rounded-lg hover:bg-gray-50"><span>Publications</span><span class="bg-gray-100 text-gray-400 text-[10px] font-bold px-2 py-0.5 rounded-full">15</span></a></li>
          </ul>
        </div>
        <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6">
          <h3 class="font-bold text-navy text-sm mb-4 uppercase tracking-wider">Recent Posts</h3>
          <ul class="space-y-3 text-sm">
            <li><a href="single.html" class="flex gap-3 text-gray-500 hover:text-green transition-colors group"><div class="w-12 h-12 rounded-lg bg-gradient-to-br from-navy to-steel shrink-0 flex items-center justify-center text-white text-xs font-bold">12</div><div><span class="text-xs text-gray-400">June 2025</span><br><span class="group-hover:text-green">Independence Day Celebrations</span></div></a></li>
            <li><a href="single.html" class="flex gap-3 text-gray-500 hover:text-green transition-colors group"><div class="w-12 h-12 rounded-lg bg-gradient-to-br from-navy to-steel shrink-0 flex items-center justify-center text-white text-xs font-bold">08</div><div><span class="text-xs text-gray-400">June 2025</span><br><span class="group-hover:text-green">Digital Signature Launch</span></div></a></li>
            <li><a href="single.html" class="flex gap-3 text-gray-500 hover:text-green transition-colors group"><div class="w-12 h-12 rounded-lg bg-gradient-to-br from-navy to-steel shrink-0 flex items-center justify-center text-white text-xs font-bold">05</div><div><span class="text-xs text-gray-400">June 2025</span><br><span class="group-hover:text-green">Grama Niladhari Training</span></div></a></li>
          </ul>
        </div>
        <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6">
          <h3 class="font-bold text-navy text-sm mb-4 uppercase tracking-wider">Search</h3>
          <form action="search.html" method="get" class="flex gap-2"><input type="text" name="s" placeholder="Search news..." class="w-full border border-gray-200 rounded-lg px-3 py-2 text-xs focus:outline-none focus:border-green"><button type="submit" class="bg-green text-white font-bold px-4 py-2 rounded-lg text-xs hover:bg-green-600 transition-all"><i class="fas fa-search"></i></button></form>
        </div>
      </aside>
    </div>
  </div>
</section>
'@

# 3. single.html
New-Page -Filename "single.html" -Title "Single Post - Ministry of Home Affairs, Sri Lanka" -Desc "Read the full article from the Ministry of Home Affairs, Sri Lanka." -ContentHtml @'
<div class="banner-page relative overflow-hidden">
  <img src="https://placehold.co/1600x600/1a3a6a/2D5F8A?text=Article" alt="" class="absolute inset-0 w-full h-full object-cover z-[1]">
  <div class="absolute inset-0 bg-gradient-to-r from-navy/80 via-navy/60 to-steel/50 z-[2]"></div>
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-14 lg:py-20 relative z-10">
    <div class="flex items-center gap-2 text-xs text-white/40 mb-4">
      <a href="index.html" class="hover:text-green transition-colors"><i class="fas fa-house-chimney mr-1"></i>Home</a><i class="fas fa-chevron-right text-[8px]"></i>
      <a href="home.html" class="hover:text-green transition-colors">News</a><i class="fas fa-chevron-right text-[8px]"></i>
      <span class="text-green font-medium">78th National Independence Day Celebrated at Independence Square</span>
    </div>
    <h1 class="text-3xl lg:text-5xl font-extrabold text-white mb-3">78th National Independence Day Celebrated at Independence Square</h1>
    <p class="text-white/60 max-w-2xl text-base leading-relaxed">The Ministry coordinated this year&rsquo;s national celebrations with full state honors and cultural performances.</p>
  </div>
</div>

<section class="py-14 lg:py-20 bg-gray-50">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="grid lg:grid-cols-3 gap-12">
      <div class="lg:col-span-2">
        <article class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden">
          <img src="https://placehold.co/1200x500/1a3a6a/FFFFFF?text=78th+National+Independence+Day+Celebrations" alt="" class="w-full h-64 sm:h-80 lg:h-96 object-cover">
          <div class="p-8 lg:p-10">
            <div class="flex flex-wrap items-center gap-4 text-[12px] text-gray-400 mb-5"><span class="bg-green/10 text-green font-semibold px-3 py-1 rounded-full">Press Release</span><span><i class="far fa-calendar-alt mr-1.5 text-green"></i>June 12, 2025</span><span><i class="far fa-user mr-1.5 text-green"></i>Media Unit</span><span><i class="far fa-comment mr-1.5 text-green"></i>3 Comments</span></div>
            <div class="prose prose-gray max-w-none text-gray-500 leading-relaxed space-y-5">
              <p>The Ministry of Home Affairs coordinated the 78th Independence Day celebrations at Independence Square on February 4, 2025, with full state honors and a vibrant cultural showcase. The event was graced by the presence of the President, Prime Minister, and other dignitaries.</p>
              <p>The ceremony commenced with the national anthem and a 21-gun salute, followed by a parade of the tri-forces and police. Cultural performances representing all provinces were presented throughout the day.</p>
              <blockquote class="border-l-4 border-green bg-gray-50 rounded-r-xl px-6 py-5 my-6 italic text-gray-500">&ldquo;Independence Day is a reminder of our collective responsibility to uphold the sovereignty and territorial integrity of our nation. Let us work together to build a prosperous Sri Lanka.&rdquo; &mdash; President of Sri Lanka</blockquote>
              <p>Special emphasis was placed on the theme &ldquo;A Vibrant Nation for Tomorrow,&rdquo; highlighting the government&rsquo;s commitment to economic recovery, digital transformation, and national unity.</p>
              <p>The Ministry extends its gratitude to all participants, security forces, and volunteers who contributed to the success of this national event.</p>
            </div>
            <div class="flex flex-wrap items-center gap-2 mt-8 pt-6 border-t border-gray-100"><span class="text-xs text-gray-400 font-semibold mr-1">Tags:</span><a href="tag.html" class="bg-gray-100 text-gray-500 text-[11px] font-medium px-3 py-1 rounded-full hover:bg-green hover:text-white transition-all">Independence Day</a><a href="tag.html" class="bg-gray-100 text-gray-500 text-[11px] font-medium px-3 py-1 rounded-full hover:bg-green hover:text-white transition-all">National Event</a><a href="tag.html" class="bg-gray-100 text-gray-500 text-[11px] font-medium px-3 py-1 rounded-full hover:bg-green hover:text-white transition-all">Celebrations</a></div>
          </div>
        </article>
        <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 sm:p-8 mt-8 flex items-center gap-5">
          <div class="w-16 h-16 rounded-full bg-gradient-to-br from-navy to-steel flex items-center justify-center text-white text-2xl shrink-0"><i class="fas fa-user-tie"></i></div>
          <div><h4 class="font-bold text-navy text-sm">Media Unit</h4><p class="text-gray-400 text-xs mt-1">Ministry of Home Affairs, Public Administration &amp; Disaster Management</p></div>
        </div>
        <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6 sm:p-8 mt-8">
          <h3 class="font-bold text-navy text-base mb-6">Leave a Comment</h3>
          <form class="space-y-4"><div class="grid sm:grid-cols-2 gap-4"><div><input type="text" placeholder="Your Name" class="w-full border border-gray-200 rounded-lg px-3.5 py-2.5 text-sm focus:outline-none focus:border-green"></div><div><input type="email" placeholder="Email Address" class="w-full border border-gray-200 rounded-lg px-3.5 py-2.5 text-sm focus:outline-none focus:border-green"></div></div><div><textarea rows="4" placeholder="Your Comment..." class="w-full border border-gray-200 rounded-lg px-3.5 py-2.5 text-sm focus:outline-none focus:border-green resize-none"></textarea></div><button type="submit" class="bg-green text-white font-bold px-6 py-3 rounded-xl text-sm hover:bg-green-600 transition-all flex items-center gap-2"><i class="fas fa-paper-plane"></i> Post Comment</button></form>
        </div>
      </div>
      <aside class="space-y-8">
        <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6"><h3 class="font-bold text-navy text-sm mb-4 uppercase tracking-wider">Categories</h3><ul class="space-y-2 text-sm">__SIDEBAR_CATEGORIES__</ul></div>
        <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6"><h3 class="font-bold text-navy text-sm mb-4 uppercase tracking-wider">Recent Posts</h3><ul class="space-y-3 text-sm">__SIDEBAR_RECENT__</ul></div>
        <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6"><h3 class="font-bold text-navy text-sm mb-4 uppercase tracking-wider">Search</h3><form action="search.html" method="get" class="flex gap-2"><input type="text" name="s" placeholder="Search..." class="w-full border border-gray-200 rounded-lg px-3 py-2 text-xs focus:outline-none focus:border-green"><button type="submit" class="bg-green text-white font-bold px-4 py-2 rounded-lg text-xs hover:bg-green-600 transition-all"><i class="fas fa-search"></i></button></form></div>
      </aside>
    </div>
  </div>
</section>
'@

# 4. page.html
New-Page -Filename "page.html" -Title "Page - Ministry of Home Affairs, Sri Lanka" -Desc "Default page template for the Ministry of Home Affairs, Sri Lanka." -ContentHtml @'
<div class="banner-page relative overflow-hidden">
  <img src="https://placehold.co/1600x600/1a3a6a/2D5F8A?text=Sample+Page" alt="" class="absolute inset-0 w-full h-full object-cover z-[1]">
  <div class="absolute inset-0 bg-gradient-to-r from-navy/80 via-navy/60 to-steel/50 z-[2]"></div>
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-14 lg:py-20 relative z-10">
    <div class="flex items-center gap-2 text-xs text-white/40 mb-4">
      <a href="index.html" class="hover:text-green transition-colors"><i class="fas fa-house-chimney mr-1"></i>Home</a>
      <i class="fas fa-chevron-right text-[8px]"></i>
      <span class="text-green font-medium">Sample Page</span>
    </div>
    <h1 class="text-3xl lg:text-5xl font-extrabold text-white mb-3">Sample Page</h1>
    <p class="text-white/60 max-w-2xl text-base leading-relaxed">This is a default page template for static content.</p>
  </div>
</div>

<section class="py-14 lg:py-20 bg-gray-50">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="grid lg:grid-cols-3 gap-12">
      <div class="lg:col-span-2">
        <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-8 lg:p-10 space-y-6 text-gray-500 leading-relaxed">
          <h2 class="text-2xl lg:text-3xl font-bold text-navy">Section Heading</h2>
          <p>This is a default page template. It is used to display static pages on the website. The layout includes a main content area on the left and a sidebar on the right. You can add any content here using the WordPress editor or custom HTML.</p>
          <p>The Ministry of Home Affairs is responsible for public administration, home affairs, and disaster management across Sri Lanka. With a network of 25 District Secretariats, 331 Divisional Secretariats, and over 14,000 Grama Niladhari offices, the Ministry serves as the backbone of government service delivery at the grassroots level.</p>
          <ul class="space-y-2"><li class="flex items-start gap-3"><i class="fas fa-check-circle text-green mt-1"></i> Transparent and accountable governance</li><li class="flex items-start gap-3"><i class="fas fa-check-circle text-green mt-1"></i> Citizen-centered public service delivery</li><li class="flex items-start gap-3"><i class="fas fa-check-circle text-green mt-1"></i> Digital transformation of government processes</li><li class="flex items-start gap-3"><i class="fas fa-check-circle text-green mt-1"></i> Disaster risk reduction and management</li></ul>
          <img src="https://placehold.co/800x400/1a3a6a/FFFFFF?text=Page+Content+Image" alt="" class="w-full rounded-xl">
          <p>The Ministry continues to implement reforms aimed at improving efficiency, transparency, and accessibility of public services across the country. Through digital initiatives and capacity building programs, we are working towards a more responsive and effective public administration system.</p>
        </div>
      </div>
      <aside class="space-y-6">
        <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6"><h3 class="font-bold text-navy text-base mb-4 flex items-center gap-2"><i class="fas fa-list text-green"></i> On This Page</h3><ul class="space-y-2 text-sm"><li><a href="#" class="text-gray-500 hover:text-green flex items-center gap-2.5 sidebar-link rounded-lg px-3 py-2 -mx-3"><i class="fas fa-chevron-right text-[8px] text-green"></i> Section Heading</a></li><li><a href="#" class="text-gray-500 hover:text-green flex items-center gap-2.5 sidebar-link rounded-lg px-3 py-2 -mx-3"><i class="fas fa-chevron-right text-[8px] text-green"></i> Related Information</a></li><li><a href="#" class="text-gray-500 hover:text-green flex items-center gap-2.5 sidebar-link rounded-lg px-3 py-2 -mx-3"><i class="fas fa-chevron-right text-[8px] text-green"></i> Downloads</a></li></ul></div>
        <div class="bg-navy text-white rounded-2xl shadow-sm p-6"><h3 class="font-bold text-base mb-4 flex items-center gap-2"><i class="fas fa-headset text-green"></i> Quick Contacts</h3><div class="space-y-3 text-sm text-white/70"><span class="flex items-center gap-3"><i class="fas fa-phone text-green w-4"></i> +94 112 050 450</span><span class="flex items-center gap-3"><i class="fas fa-envelope text-green w-4"></i> info@moha.gov.lk</span><span class="flex items-center gap-3"><i class="fas fa-location-dot text-green w-4"></i> Nila Madura, Independence Sq, Colombo 07</span></div><a href="contact.html" class="mt-5 inline-flex items-center gap-2 bg-green text-white font-bold px-5 py-2.5 rounded-xl text-sm hover:bg-green-600 transition-all w-full justify-center">Contact <i class="fas fa-arrow-right text-[10px]"></i></a></div>
      </aside>
    </div>
  </div>
</section>
'@

# 5. archive.html
New-Page -Filename "archive.html" -Title "Archives - Ministry of Home Affairs, Sri Lanka" -Desc "Browse the complete archive of news, publications, and announcements from the Ministry of Home Affairs." -ContentHtml @'
<div class="banner-page relative overflow-hidden">
  <img src="https://placehold.co/1600x600/1a3a6a/2D5F8A?text=Archives" alt="" class="absolute inset-0 w-full h-full object-cover z-[1]">
  <div class="absolute inset-0 bg-gradient-to-r from-navy/80 via-navy/60 to-steel/50 z-[2]"></div>
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-14 lg:py-20 relative z-10">
    <div class="flex items-center gap-2 text-xs text-white/40 mb-4">
      <a href="index.html" class="hover:text-green transition-colors"><i class="fas fa-house-chimney mr-1"></i>Home</a>
      <i class="fas fa-chevron-right text-[8px]"></i>
      <span class="text-green font-medium">Archives</span>
    </div>
    <h1 class="text-3xl lg:text-5xl font-extrabold text-white mb-3">Archives</h1>
    <p class="text-white/60 max-w-2xl text-base leading-relaxed">Browse all archived news, publications, and official announcements.</p>
  </div>
</div>

<section class="py-14 lg:py-20 bg-gray-50">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="flex flex-wrap items-center justify-between gap-4 mb-8"><p class="text-gray-400 text-sm">Browse all archived posts and publications from the Ministry.</p><div class="flex flex-wrap gap-2"><select class="border border-gray-200 rounded-lg px-3 py-2 text-xs text-gray-600 bg-white focus:outline-none focus:border-green"><option>All Years</option><option>2025</option><option>2024</option><option>2023</option></select><select class="border border-gray-200 rounded-lg px-3 py-2 text-xs text-gray-600 bg-white focus:outline-none focus:border-green"><option>All Months</option><option>January</option><option>February</option><option>March</option><option>April</option><option>May</option><option>June</option></select><button class="bg-green text-white font-bold px-4 py-2 rounded-lg text-xs hover:bg-green-600 transition-all">Filter</button></div></div>
    <div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">
      <article class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden hover:shadow-md transition-all group"><div class="relative overflow-hidden"><img src="https://placehold.co/600x350/1a3a6a/FFFFFF?text=Independence+Day" alt="" class="w-full h-44 object-cover group-hover:scale-105 transition-transform duration-500"><div class="absolute top-3 left-3 bg-navy/80 text-white text-[10px] font-bold px-2.5 py-1 rounded">June 2025</div></div><div class="p-5"><h3 class="font-bold text-navy text-sm mb-2 group-hover:text-green">78th National Independence Day</h3><p class="text-gray-400 text-xs leading-relaxed mb-3">The Ministry coordinated the 78th Independence Day celebrations with full state honors.</p><a href="single.html" class="text-green text-xs font-semibold inline-flex items-center gap-1.5 hover:gap-2.5">Read More <i class="fas fa-arrow-right text-[8px]"></i></a></div></article>
      <article class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden hover:shadow-md transition-all group"><div class="relative overflow-hidden"><img src="https://placehold.co/600x350/2D5F8A/FFFFFF?text=Digital+Signature" alt="" class="w-full h-44 object-cover group-hover:scale-105 transition-transform duration-500"><div class="absolute top-3 left-3 bg-navy/80 text-white text-[10px] font-bold px-2.5 py-1 rounded">June 2025</div></div><div class="p-5"><h3 class="font-bold text-navy text-sm mb-2 group-hover:text-green">Digital Signature System</h3><p class="text-gray-400 text-xs leading-relaxed mb-3">New digital signature platform for secure document verification across government.</p><a href="single.html" class="text-green text-xs font-semibold inline-flex items-center gap-1.5 hover:gap-2.5">Read More <i class="fas fa-arrow-right text-[8px]"></i></a></div></article>
      <article class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden hover:shadow-md transition-all group"><div class="relative overflow-hidden"><img src="https://placehold.co/600x350/801200/FFFFFF?text=Grama+Niladhari" alt="" class="w-full h-44 object-cover group-hover:scale-105 transition-transform duration-500"><div class="absolute top-3 left-3 bg-navy/80 text-white text-[10px] font-bold px-2.5 py-1 rounded">June 2025</div></div><div class="p-5"><h3 class="font-bold text-navy text-sm mb-2 group-hover:text-green">Grama Niladhari Training</h3><p class="text-gray-400 text-xs leading-relaxed mb-3">Island-wide training programme for Grama Niladhari officers commencing soon.</p><a href="single.html" class="text-green text-xs font-semibold inline-flex items-center gap-1.5 hover:gap-2.5">Read More <i class="fas fa-arrow-right text-[8px]"></i></a></div></article>
      <article class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden hover:shadow-md transition-all group"><div class="relative overflow-hidden"><img src="https://placehold.co/600x350/0A1931/FFFFFF?text=Circuit+Bungalow" alt="" class="w-full h-44 object-cover group-hover:scale-105 transition-transform duration-500"><div class="absolute top-3 left-3 bg-navy/80 text-white text-[10px] font-bold px-2.5 py-1 rounded">May 2025</div></div><div class="p-5"><h3 class="font-bold text-navy text-sm mb-2 group-hover:text-green">Circuit Bungalow Booking 24/7</h3><p class="text-gray-400 text-xs leading-relaxed mb-3">New online booking system now operational around the clock.</p><a href="single.html" class="text-green text-xs font-semibold inline-flex items-center gap-1.5 hover:gap-2.5">Read More <i class="fas fa-arrow-right text-[8px]"></i></a></div></article>
      <article class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden hover:shadow-md transition-all group"><div class="relative overflow-hidden"><img src="https://placehold.co/600x350/2D5F8A/FFFFFF?text=Admin+Reforms" alt="" class="w-full h-44 object-cover group-hover:scale-105 transition-transform duration-500"><div class="absolute top-3 left-3 bg-navy/80 text-white text-[10px] font-bold px-2.5 py-1 rounded">May 2025</div></div><div class="p-5"><h3 class="font-bold text-navy text-sm mb-2 group-hover:text-green">Public Admin Reforms Q3 2025</h3><p class="text-gray-400 text-xs leading-relaxed mb-3">Comprehensive reforms to improve efficiency across all divisions.</p><a href="single.html" class="text-green text-xs font-semibold inline-flex items-center gap-1.5 hover:gap-2.5">Read More <i class="fas fa-arrow-right text-[8px]"></i></a></div></article>
      <article class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden hover:shadow-md transition-all group"><div class="relative overflow-hidden"><img src="https://placehold.co/600x350/801200/FFFFFF?text=E-Visa+System" alt="" class="w-full h-44 object-cover group-hover:scale-105 transition-transform duration-500"><div class="absolute top-3 left-3 bg-navy/80 text-white text-[10px] font-bold px-2.5 py-1 rounded">May 2025</div></div><div class="p-5"><h3 class="font-bold text-navy text-sm mb-2 group-hover:text-green">E-Visa System for 30 Countries</h3><p class="text-gray-400 text-xs leading-relaxed mb-3">New electronic visa system to boost tourism and business travel.</p><a href="single.html" class="text-green text-xs font-semibold inline-flex items-center gap-1.5 hover:gap-2.5">Read More <i class="fas fa-arrow-right text-[8px]"></i></a></div></article>
    </div>
    <div class="flex items-center justify-center gap-2 pt-8 mt-8 border-t border-gray-100"><a href="#" class="w-9 h-9 rounded-lg border border-gray-200 flex items-center justify-center text-xs text-gray-400 hover:bg-green hover:text-white hover:border-green transition-all"><i class="fas fa-chevron-left"></i></a><a href="#" class="w-9 h-9 rounded-lg bg-green text-white flex items-center justify-center text-xs font-bold">1</a><a href="#" class="w-9 h-9 rounded-lg border border-gray-200 flex items-center justify-center text-xs text-gray-600 hover:bg-green hover:text-white hover:border-green transition-all">2</a><a href="#" class="w-9 h-9 rounded-lg border border-gray-200 flex items-center justify-center text-xs text-gray-600 hover:bg-green hover:text-white hover:border-green transition-all">3</a><span class="text-gray-300 text-xs px-1">...</span><a href="#" class="w-9 h-9 rounded-lg border border-gray-200 flex items-center justify-center text-xs text-gray-600 hover:bg-green hover:text-white hover:border-green transition-all">8</a><a href="#" class="w-9 h-9 rounded-lg border border-gray-200 flex items-center justify-center text-xs text-gray-400 hover:bg-green hover:text-white hover:border-green transition-all"><i class="fas fa-chevron-right"></i></a></div>
  </div>
</section>
'@

# 6. category.html
New-Page -Filename "category.html" -Title "Category Archives - Ministry of Home Affairs, Sri Lanka" -Desc "Browse all articles in this category from the Ministry of Home Affairs." -ContentHtml @'
<div class="banner-page relative overflow-hidden">
  <img src="https://placehold.co/1600x600/2D5F8A/1a3a6a?text=Press+Releases" alt="" class="absolute inset-0 w-full h-full object-cover z-[1]">
  <div class="absolute inset-0 bg-gradient-to-r from-navy/80 via-navy/60 to-steel/50 z-[2]"></div>
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-14 lg:py-20 relative z-10">
    <div class="flex items-center gap-2 text-xs text-white/40 mb-4">
      <a href="index.html" class="hover:text-green transition-colors"><i class="fas fa-house-chimney mr-1"></i>Home</a>
      <i class="fas fa-chevron-right text-[8px]"></i>
      <span class="text-green font-medium">Press Releases</span>
    </div>
    <h1 class="text-3xl lg:text-5xl font-extrabold text-white mb-3">Press Releases</h1>
    <p class="text-white/60 max-w-2xl text-base leading-relaxed">Official press releases and media statements from the Ministry of Home Affairs.</p>
  </div>
</div>

<section class="py-14 lg:py-20 bg-gray-50">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="mb-8"><p class="text-gray-400 text-sm">All articles categorized under &ldquo;Press Releases&rdquo; &mdash; official media statements and announcements.</p></div>
    <div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">
      <article class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden hover:shadow-md transition-all group"><div class="relative overflow-hidden"><img src="https://placehold.co/600x350/1a3a6a/FFFFFF?text=Press+Release" alt="" class="w-full h-44 object-cover group-hover:scale-105 transition-transform duration-500"><span class="absolute top-3 left-3 bg-green text-white text-[10px] font-bold px-2.5 py-1 rounded">Press Release</span></div><div class="p-5"><div class="flex items-center gap-2 text-[11px] text-gray-400 mb-2"><span><i class="far fa-calendar-alt mr-1 text-green"></i>June 12, 2025</span></div><h3 class="font-bold text-navy text-sm mb-2 group-hover:text-green">Official Statement on Independence Day Celebrations</h3><a href="single.html" class="text-green text-xs font-semibold inline-flex items-center gap-1.5 hover:gap-2.5">Read More <i class="fas fa-arrow-right text-[8px]"></i></a></div></article>
      <article class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden hover:shadow-md transition-all group"><div class="relative overflow-hidden"><img src="https://placehold.co/600x350/2D5F8A/FFFFFF?text=Press+Release" alt="" class="w-full h-44 object-cover group-hover:scale-105 transition-transform duration-500"><span class="absolute top-3 left-3 bg-green text-white text-[10px] font-bold px-2.5 py-1 rounded">Press Release</span></div><div class="p-5"><div class="flex items-center gap-2 text-[11px] text-gray-400 mb-2"><span><i class="far fa-calendar-alt mr-1 text-green"></i>June 8, 2025</span></div><h3 class="font-bold text-navy text-sm mb-2 group-hover:text-green">Digital Signature Platform Goes Live</h3><a href="single.html" class="text-green text-xs font-semibold inline-flex items-center gap-1.5 hover:gap-2.5">Read More <i class="fas fa-arrow-right text-[8px]"></i></a></div></article>
      <article class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden hover:shadow-md transition-all group"><div class="relative overflow-hidden"><img src="https://placehold.co/600x350/801200/FFFFFF?text=Press+Release" alt="" class="w-full h-44 object-cover group-hover:scale-105 transition-transform duration-500"><span class="absolute top-3 left-3 bg-green text-white text-[10px] font-bold px-2.5 py-1 rounded">Press Release</span></div><div class="p-5"><div class="flex items-center gap-2 text-[11px] text-gray-400 mb-2"><span><i class="far fa-calendar-alt mr-1 text-green"></i>June 5, 2025</span></div><h3 class="font-bold text-navy text-sm mb-2 group-hover:text-green">New Training Programme for Grama Niladhari Officers</h3><a href="single.html" class="text-green text-xs font-semibold inline-flex items-center gap-1.5 hover:gap-2.5">Read More <i class="fas fa-arrow-right text-[8px]"></i></a></div></article>
    </div>
    <div class="flex items-center justify-center gap-2 pt-8 mt-8 border-t border-gray-100">__PAGINATION__</div>
  </div>
</section>
'@

# 7. tag.html
New-Page -Filename "tag.html" -Title "Tag Archives - Ministry of Home Affairs, Sri Lanka" -Desc "Browse all articles tagged with this topic from the Ministry of Home Affairs." -ContentHtml @'
<div class="banner-page relative overflow-hidden">
  <img src="https://placehold.co/1600x600/0A1931/2D5F8A?text=Digital+Transformation" alt="" class="absolute inset-0 w-full h-full object-cover z-[1]">
  <div class="absolute inset-0 bg-gradient-to-r from-navy/80 via-navy/60 to-steel/50 z-[2]"></div>
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-14 lg:py-20 relative z-10">
    <div class="flex items-center gap-2 text-xs text-white/40 mb-4">
      <a href="index.html" class="hover:text-green transition-colors"><i class="fas fa-house-chimney mr-1"></i>Home</a>
      <i class="fas fa-chevron-right text-[8px]"></i>
      <span class="text-green font-medium">Digital Transformation</span>
    </div>
    <h1 class="text-3xl lg:text-5xl font-extrabold text-white mb-3">Digital Transformation</h1>
    <p class="text-white/60 max-w-2xl text-base leading-relaxed">Articles exploring technology initiatives and e-governance projects.</p>
  </div>
</div>

<section class="py-14 lg:py-20 bg-gray-50">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="mb-8"><p class="text-gray-400 text-sm">All articles tagged with &ldquo;Digital Transformation&rdquo; &mdash; exploring technology initiatives and e-governance projects.</p></div>
    <div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-6">
      <article class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden hover:shadow-md transition-all group"><div class="relative overflow-hidden"><img src="https://placehold.co/600x350/2D5F8A/FFFFFF?text=Digital+Signature" alt="" class="w-full h-44 object-cover group-hover:scale-105 transition-transform duration-500"><div class="p-5"><div class="flex items-center gap-2 text-[11px] text-gray-400 mb-2"><span><i class="far fa-calendar-alt mr-1 text-green"></i>June 8, 2025</span></div><h3 class="font-bold text-navy text-sm mb-2 group-hover:text-green">Digital Signature System Launched</h3><p class="text-gray-400 text-xs leading-relaxed mb-3">New platform for secure document verification across government institutions.</p><a href="single.html" class="text-green text-xs font-semibold inline-flex items-center gap-1.5 hover:gap-2.5">Read More <i class="fas fa-arrow-right text-[8px]"></i></a></div></div></article>
      <article class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden hover:shadow-md transition-all group"><div class="relative overflow-hidden"><img src="https://placehold.co/600x350/0A1931/FFFFFF?text=Circuit+Bungalow" alt="" class="w-full h-44 object-cover group-hover:scale-105 transition-transform duration-500"><div class="p-5"><div class="flex items-center gap-2 text-[11px] text-gray-400 mb-2"><span><i class="far fa-calendar-alt mr-1 text-green"></i>May 28, 2025</span></div><h3 class="font-bold text-navy text-sm mb-2 group-hover:text-green">Circuit Bungalow Booking 24/7</h3><p class="text-gray-400 text-xs leading-relaxed mb-3">Online booking system now operational around the clock.</p><a href="single.html" class="text-green text-xs font-semibold inline-flex items-center gap-1.5 hover:gap-2.5">Read More <i class="fas fa-arrow-right text-[8px]"></i></a></div></div></article>
      <article class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden hover:shadow-md transition-all group"><div class="relative overflow-hidden"><img src="https://placehold.co/600x350/801200/FFFFFF?text=E-Visa+System" alt="" class="w-full h-44 object-cover group-hover:scale-105 transition-transform duration-500"><div class="p-5"><div class="flex items-center gap-2 text-[11px] text-gray-400 mb-2"><span><i class="far fa-calendar-alt mr-1 text-green"></i>May 15, 2025</span></div><h3 class="font-bold text-navy text-sm mb-2 group-hover:text-green">E-Visa System for 30 Countries</h3><p class="text-gray-400 text-xs leading-relaxed mb-3">New electronic visa system to boost tourism and business travel.</p><a href="single.html" class="text-green text-xs font-semibold inline-flex items-center gap-1.5 hover:gap-2.5">Read More <i class="fas fa-arrow-right text-[8px]"></i></a></div></div></article>
    </div>
    <div class="flex items-center justify-center gap-2 pt-8 mt-8 border-t border-gray-100">__PAGINATION__</div>
  </div>
</section>
'@

# 8. search.html
New-Page -Filename "search.html" -Title "Search Results - Ministry of Home Affairs, Sri Lanka" -Desc "Search the Ministry of Home Affairs website for news, publications, and information." -ContentHtml @'
<div class="banner-page relative overflow-hidden">
  <img src="https://placehold.co/1600x600/0A1931/2D5F8A?text=Search" alt="" class="absolute inset-0 w-full h-full object-cover z-[1]">
  <div class="absolute inset-0 bg-gradient-to-r from-navy/80 via-navy/60 to-steel/50 z-[2]"></div>
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-14 lg:py-20 relative z-10">
    <div class="flex items-center gap-2 text-xs text-white/40 mb-4">
      <a href="index.html" class="hover:text-green transition-colors"><i class="fas fa-house-chimney mr-1"></i>Home</a>
      <i class="fas fa-chevron-right text-[8px]"></i>
      <span class="text-green font-medium">Search</span>
    </div>
    <h1 class="text-3xl lg:text-5xl font-extrabold text-white mb-3">Search</h1>
    <p class="text-white/60 max-w-2xl text-base leading-relaxed">Search the Ministry website for news, publications, and information.</p>
  </div>
</div>

<section class="py-14 lg:py-20 bg-gray-50">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="max-w-2xl mx-auto mb-10"><form action="search.html" method="get" class="flex gap-3"><input type="text" name="s" value="digital" placeholder="Search the website..." class="flex-1 border border-gray-200 rounded-xl px-5 py-3.5 text-sm focus:outline-none focus:border-green shadow-sm"><button type="submit" class="bg-green text-white font-bold px-6 py-3.5 rounded-xl text-sm hover:bg-green-600 transition-all shadow-lg shadow-green/25 flex items-center gap-2"><i class="fas fa-search"></i> Search</button></form></div>
    <p class="text-gray-400 text-sm mb-8">5 results found for &ldquo;digital&rdquo;</p>
    <div class="space-y-4 max-w-3xl mx-auto">
      <a href="single.html" class="block bg-white rounded-xl border border-gray-100 p-5 hover:shadow-md transition-all"><h3 class="text-base font-bold text-navy mb-1 hover:text-green">Digital Signature System Launched</h3><p class="text-xs text-gray-400 mb-2">June 8, 2025 &mdash; Press Release</p><p class="text-sm text-gray-500">New digital signature platform for secure document verification across all government institutions...</p></a>
      <a href="single.html" class="block bg-white rounded-xl border border-gray-100 p-5 hover:shadow-md transition-all"><h3 class="text-base font-bold text-navy mb-1 hover:text-green">National Digital Identity Card Pilot Project</h3><p class="text-xs text-gray-400 mb-2">May 10, 2025 &mdash; Announcement</p><p class="text-sm text-gray-500">Pilot project for the National Digital Identity card to begin next quarter across selected districts...</p></a>
      <a href="single.html" class="block bg-white rounded-xl border border-gray-100 p-5 hover:shadow-md transition-all"><h3 class="text-base font-bold text-navy mb-1 hover:text-green">Online Passport Renewal Service Expanded</h3><p class="text-xs text-gray-400 mb-2">April 22, 2025 &mdash; Service Update</p><p class="text-sm text-gray-500">Online passport renewal service now available at all district secretariats across the country...</p></a>
      <a href="single.html" class="block bg-white rounded-xl border border-gray-100 p-5 hover:shadow-md transition-all"><h3 class="text-base font-bold text-navy mb-1 hover:text-green">Digital Transformation Roadmap 2025</h3><p class="text-xs text-gray-400 mb-2">March 15, 2025 &mdash; Publication</p><p class="text-sm text-gray-500">Comprehensive roadmap for digital transformation of public administration services...</p></a>
      <a href="single.html" class="block bg-white rounded-xl border border-gray-100 p-5 hover:shadow-md transition-all"><h3 class="text-base font-bold text-navy mb-1 hover:text-green">E-Visa System for 30 Countries</h3><p class="text-xs text-gray-400 mb-2">May 15, 2025 &mdash; Announcement</p><p class="text-sm text-gray-500">New electronic visa system launched to boost tourism and business travel to Sri Lanka...</p></a>
    </div>
    <div class="flex items-center justify-center gap-2 pt-8 mt-8 border-t border-gray-100">__PAGINATION__</div>
  </div>
</section>
'@

# 9. 404.html
New-Page -Filename "404.html" -Title "404 Not Found - Ministry of Home Affairs, Sri Lanka" -Desc "Page not found. The page you are looking for might have been moved or deleted." -ContentHtml @'
<div class="banner-page relative overflow-hidden" style="min-height:300px">
  <div class="absolute inset-0 bg-gradient-to-r from-navy via-navy/95 to-steel/80 z-[2]"></div>
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-20 lg:py-28 relative z-10 text-center">
    <h1 class="text-8xl sm:text-9xl lg:text-[10rem] font-black text-white/10 mb-4 leading-none">404</h1>
    <h2 class="text-3xl lg:text-4xl font-extrabold text-white mb-4">Page Not Found</h2>
    <p class="text-white/50 max-w-xl mx-auto text-base mb-8">The page you are looking for might have been moved, deleted, or the link may be incorrect.</p>
    <div class="max-w-md mx-auto mb-10"><form action="search.html" method="get" class="flex gap-2"><input type="text" name="s" placeholder="Search the website..." class="flex-1 border border-white/20 bg-white/10 rounded-xl px-4 py-3 text-sm text-white placeholder-gray-400 focus:outline-none focus:border-green"><button type="submit" class="bg-green text-white font-bold px-5 py-3 rounded-xl text-sm hover:bg-green-600 transition-all"><i class="fas fa-search"></i></button></form></div>
    <div class="flex gap-3 justify-center flex-wrap">
      <a href="index.html" class="bg-green text-white font-bold px-6 py-3 rounded-xl text-sm hover:bg-green-600 transition-all shadow-lg shadow-green/25 inline-flex items-center gap-2"><i class="fas fa-house"></i> Go Home</a>
      <a href="sitemap.html" class="bg-white/10 text-white font-semibold px-6 py-3 rounded-xl text-sm hover:bg-white/20 transition-all border border-white/20 inline-flex items-center gap-2"><i class="fas fa-sitemap"></i> Sitemap</a>
      <a href="contact.html" class="bg-white/10 text-white font-semibold px-6 py-3 rounded-xl text-sm hover:bg-white/20 transition-all border border-white/20 inline-flex items-center gap-2"><i class="fas fa-envelope"></i> Contact</a>
    </div>
  </div>
</div>
'@

# 10. singular.html
New-Page -Filename "singular.html" -Title "Singular - Ministry of Home Affairs, Sri Lanka" -Desc "Generic singular content template for the Ministry of Home Affairs." -ContentHtml @'
<div class="banner-page relative overflow-hidden">
  <img src="https://placehold.co/1600x600/1a3a6a/2D5F8A?text=Content" alt="" class="absolute inset-0 w-full h-full object-cover z-[1]">
  <div class="absolute inset-0 bg-gradient-to-r from-navy/80 via-navy/60 to-steel/50 z-[2]"></div>
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-14 lg:py-20 relative z-10">
    <div class="flex items-center gap-2 text-xs text-white/40 mb-4">
      <a href="index.html" class="hover:text-green transition-colors"><i class="fas fa-house-chimney mr-1"></i>Home</a>
      <i class="fas fa-chevron-right text-[8px]"></i>
      <span class="text-green font-medium">Content</span>
    </div>
    <h1 class="text-3xl lg:text-5xl font-extrabold text-white mb-3">Content Title</h1>
    <p class="text-white/60 max-w-2xl text-base leading-relaxed">Generic singular content template description.</p>
  </div>
</div>

<section class="py-14 lg:py-20 bg-gray-50">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="grid lg:grid-cols-3 gap-12">
      <div class="lg:col-span-2">
        <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-8 lg:p-10">
          <div class="flex flex-wrap items-center gap-4 text-[12px] text-gray-400 mb-6 pb-6 border-b border-gray-100">
            <span><i class="far fa-calendar-alt mr-1.5 text-green"></i> June 12, 2025</span>
            <span><i class="far fa-user mr-1.5 text-green"></i> Media Unit</span>
            <span><i class="far fa-folder-open mr-1.5 text-green"></i> <a href="category.html" class="hover:text-green">Press Releases</a></span>
          </div>
          <div class="prose prose-gray max-w-none text-gray-500 leading-relaxed space-y-5">
            <p>This is a generic singular content template. It is used to display any single piece of content in WordPress&mdash;pages, posts, custom post types, or any other singular entity. The layout provides a clean, readable content area with metadata displayed prominently at the top.</p>
            <p>Content from the WordPress editor will appear here. The template supports all standard formatting including headings, lists, images, blockquotes, and embeds.</p>
            <blockquote class="border-l-4 border-green bg-gray-50 rounded-r-xl px-6 py-5 my-6 italic text-gray-500">This is a blockquote used to highlight important quotes or citations within the content.</blockquote>
            <p>The template automatically adjusts to the content type being displayed, ensuring consistent presentation across all singular content on the website.</p>
          </div>
          <div class="flex items-center justify-between mt-8 pt-6 border-t border-gray-100">
            <a href="single.html" class="text-gray-400 text-sm hover:text-green transition-colors flex items-center gap-2"><i class="fas fa-chevron-left text-[10px]"></i> Previous</a>
            <a href="single.html" class="text-gray-400 text-sm hover:text-green transition-colors flex items-center gap-2">Next <i class="fas fa-chevron-right text-[10px]"></i></a>
          </div>
        </div>
      </div>
      <aside class="space-y-6">
        <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-6"><h3 class="font-bold text-navy text-sm mb-4 uppercase tracking-wider">Categories</h3><ul class="space-y-2 text-sm">__SIDEBAR_CATEGORIES__</ul></div>
        <div class="bg-navy text-white rounded-2xl shadow-sm p-6"><h3 class="font-bold text-base mb-4 flex items-center gap-2"><i class="fas fa-headset text-green"></i> Quick Contacts</h3><div class="space-y-3 text-sm text-white/70"><span class="flex items-center gap-3"><i class="fas fa-phone text-green w-4"></i> +94 112 050 450</span><span class="flex items-center gap-3"><i class="fas fa-envelope text-green w-4"></i> info@moha.gov.lk</span></div></div>
      </aside>
    </div>
  </div>
</section>
'@

# 11. attachment.html
New-Page -Filename "attachment.html" -Title "Media Attachment - Ministry of Home Affairs, Sri Lanka" -Desc "View attached media file from the Ministry of Home Affairs." -ContentHtml @'
<div class="banner-page relative overflow-hidden">
  <img src="https://placehold.co/1600x600/1a3a6a/2D5F8A?text=Attachment" alt="" class="absolute inset-0 w-full h-full object-cover z-[1]">
  <div class="absolute inset-0 bg-gradient-to-r from-navy/80 via-navy/60 to-steel/50 z-[2]"></div>
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-14 lg:py-20 relative z-10">
    <div class="flex items-center gap-2 text-xs text-white/40 mb-4">
      <a href="index.html" class="hover:text-green transition-colors"><i class="fas fa-house-chimney mr-1"></i>Home</a>
      <i class="fas fa-chevron-right text-[8px]"></i>
      <a href="single.html" class="hover:text-green transition-colors">78th National Independence Day</a>
      <i class="fas fa-chevron-right text-[8px]"></i>
      <span class="text-green font-medium">Attachment</span>
    </div>
    <h1 class="text-3xl lg:text-5xl font-extrabold text-white mb-3">Independence Day Celebrations Photo</h1>
  </div>
</div>

<section class="py-14 lg:py-20 bg-gray-50">
  <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
    <div class="bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden">
      <a href="https://placehold.co/1600x900/1a3a6a/FFFFFF.png" class="glightbox"><img src="https://placehold.co/1200x675/1a3a6a/FFFFFF?text=Independence+Day+2025+Photo" alt="Independence Day Celebrations" class="w-full"></a>
      <div class="p-5 bg-gray-50 border-t border-gray-100"><p class="text-gray-500 text-sm italic"><i class="fas fa-camera text-green mr-2"></i>Independence Day celebrations at Independence Square, Colombo &mdash; February 4, 2025</p></div>
    </div>
    <div class="grid sm:grid-cols-3 gap-4 mt-6 mb-8">
      <div class="bg-white rounded-xl border border-gray-100 p-4 text-center"><span class="text-xs text-gray-400 block mb-1">File Type</span><span class="text-sm font-semibold text-navy">JPEG Image</span></div>
      <div class="bg-white rounded-xl border border-gray-100 p-4 text-center"><span class="text-xs text-gray-400 block mb-1">Dimensions</span><span class="text-sm font-semibold text-navy">2400 &times; 1350 px</span></div>
      <div class="bg-white rounded-xl border border-gray-100 p-4 text-center"><span class="text-xs text-gray-400 block mb-1">File Size</span><span class="text-sm font-semibold text-navy">1.2 MB</span></div>
    </div>
    <div class="flex items-center justify-between">
      <a href="single.html" class="text-gray-400 text-sm hover:text-green transition-colors flex items-center gap-2"><i class="fas fa-chevron-left text-[10px]"></i> Previous Attachment</a>
      <a href="single.html" class="text-gray-400 text-sm hover:text-green transition-colors flex items-center gap-2">Next Attachment <i class="fas fa-chevron-right text-[10px]"></i></a>
    </div>
  </div>
</section>
'@

Write-Host ""
Write-Host "All 11 WordPress template hierarchy pages generated successfully!"
Write-Host "Location: $dir"
