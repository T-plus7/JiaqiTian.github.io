document.addEventListener('DOMContentLoaded',()=>{
  const toggle=document.getElementById('themeToggle');
  const root=document.documentElement;
  const stored=localStorage.getItem('theme');
  if(stored==='dark') root.setAttribute('data-theme','dark');
  toggle.addEventListener('click',()=>{
    const isDark=root.getAttribute('data-theme')==='dark';
    if(isDark){ root.removeAttribute('data-theme'); localStorage.setItem('theme','light'); toggle.textContent='🌙' }
    else{ root.setAttribute('data-theme','dark'); localStorage.setItem('theme','dark'); toggle.textContent='☀️' }
  });
  // Smooth scroll for internal links
  document.querySelectorAll('a[href^="#"]').forEach(a=>{
    a.addEventListener('click',e=>{
      const href=a.getAttribute('href');
      if(href.length>1){
        e.preventDefault();
        const el=document.querySelector(href);
        if(el) el.scrollIntoView({behavior:'smooth',block:'start'});
      }
    });
  });
});
