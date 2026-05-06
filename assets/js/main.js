/* ============================================================================
   POWER & GLOW — Site Interactions v2.0
   ============================================================================ */

document.addEventListener('DOMContentLoaded', () => {
  initMobileMenu();
  initNavScroll();
  initFilterGalerie();
  initLightbox();
  initFadeInOnScroll();
  initFAQ();
  initNewsletterForm();
});

/* === NAV : ajout d'une classe quand on scrolle === */
function initNavScroll() {
  const nav = document.querySelector('.nav');
  if (!nav) return;
  const onScroll = () => {
    if (window.scrollY > 40) nav.classList.add('scrolled');
    else nav.classList.remove('scrolled');
  };
  window.addEventListener('scroll', onScroll, { passive: true });
  onScroll();
}

/* === MENU MOBILE === */
function initMobileMenu() {
  const toggle = document.querySelector('.menu-toggle');
  const links = document.querySelector('.nav-links');
  if (!toggle || !links) return;
  toggle.addEventListener('click', () => links.classList.toggle('open'));
  links.querySelectorAll('a').forEach(a => {
    a.addEventListener('click', () => links.classList.remove('open'));
  });
}

/* === FILTRES GALERIE === */
function initFilterGalerie() {
  const buttons = document.querySelectorAll('.filter-btn');
  const items = document.querySelectorAll('.galerie-item');

  buttons.forEach(btn => {
    btn.addEventListener('click', () => {
      const filter = btn.dataset.filter;
      buttons.forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      items.forEach(item => {
        if (filter === 'all' || item.dataset.serie === filter) {
          item.classList.remove('hidden');
        } else {
          item.classList.add('hidden');
        }
      });
    });
  });
}

/* === LIGHTBOX === */
function initLightbox() {
  const lightbox = document.querySelector('.lightbox');
  if (!lightbox) return;
  const lightboxImg = lightbox.querySelector('img');
  const closeBtn = lightbox.querySelector('.lightbox-close');

  document.querySelectorAll('.galerie-item').forEach(item => {
    item.addEventListener('click', () => {
      const img = item.querySelector('img');
      lightboxImg.src = img.src;
      lightboxImg.alt = img.alt;
      lightbox.classList.add('open');
      document.body.style.overflow = 'hidden';
    });
  });

  const close = () => {
    lightbox.classList.remove('open');
    document.body.style.overflow = '';
  };

  closeBtn.addEventListener('click', close);
  lightbox.addEventListener('click', e => { if (e.target === lightbox) close(); });
  document.addEventListener('keydown', e => { if (e.key === 'Escape') close(); });
}

/* === FAQ ACCORDÉON === */
function initFAQ() {
  document.querySelectorAll('.faq-item').forEach(item => {
    const btn = item.querySelector('.faq-question');
    if (!btn) return;
    btn.addEventListener('click', () => {
      const isOpen = item.classList.contains('open');
      // ferme tous les autres pour un seul ouvert à la fois
      document.querySelectorAll('.faq-item.open').forEach(i => i.classList.remove('open'));
      if (!isOpen) item.classList.add('open');
    });
  });
}

/* === FADE-IN AU SCROLL === */
function initFadeInOnScroll() {
  if (!('IntersectionObserver' in window)) {
    document.querySelectorAll('.fade-in').forEach(el => el.classList.add('visible'));
    return;
  }
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.12, rootMargin: '0px 0px -8% 0px' });
  document.querySelectorAll('.fade-in').forEach(el => observer.observe(el));
}

/* === NEWSLETTER (mock) === */
function initNewsletterForm() {
  const form = document.querySelector('.newsletter-form');
  if (!form) return;
  form.addEventListener('submit', e => {
    e.preventDefault();
    const input = form.querySelector('input[type=email]');
    const email = input.value.trim();
    if (!email) return;
    const btn = form.querySelector('button');
    const originalText = btn.textContent;
    btn.textContent = 'Inscrite ✨';
    btn.disabled = true;
    input.value = '';
    setTimeout(() => {
      btn.textContent = originalText;
      btn.disabled = false;
    }, 4000);
  });
}
