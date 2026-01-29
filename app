<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <base target="_top">
  <title>Surea - Quran Reading App</title>
  <style>
    :root { 
      font-family: system-ui, -apple-system, Segoe UI, Roboto, Arial, sans-serif; 
      line-height: 1.5;
    }
    
    body { 
      margin: 0; 
      background: #0b1220; 
      color: #e7eefc; 
      min-height: 100vh;
    }
    
    .wrap { 
      max-width: 420px; 
      margin: 0 auto; 
      padding: 16px; 
      box-sizing: border-box;
    }
    
    .card { 
      background: #111a2e; 
      border: 1px solid rgba(255, 255, 255, .08); 
      border-radius: 16px; 
      padding: 20px; 
      margin: 12px 0; 
      box-shadow: 0 6px 16px rgba(0, 0, 0, .18); 
    }
    
    h1, h2 { 
      margin: 0 0 12px 0; 
      color: #ffffff;
    }
    
    h1 { font-size: 24px; }
    h2 { font-size: 20px; }
    
    .muted { 
      opacity: .75; 
      font-size: 14px; 
      margin: 8px 0;
    }
    
    input, button { 
      width: 100%; 
      padding: 14px; 
      border-radius: 14px; 
      border: 1px solid rgba(255, 255, 255, .12); 
      background: #0b1220; 
      color: #e7eefc; 
      font-size: 16px; 
      box-sizing: border-box;
      margin: 8px 0;
      transition: all 0.2s ease;
    }
    
    input:focus {
      outline: none;
      border-color: #2c5cff;
      box-shadow: 0 0 0 2px rgba(44, 92, 255, 0.2);
    }
    
    button { 
      background: linear-gradient(135deg, #2c5cff, #1e40ff); 
      border: none; 
      font-weight: 700; 
      cursor: pointer; 
      color: white;
      font-size: 16px;
      padding: 15px;
    }
    
    button:hover:not(:disabled) {
      transform: translateY(-1px);
      box-shadow: 0 4px 12px rgba(44, 92, 255, 0.3);
    }
    
    button:active:not(:disabled) {
      transform: translateY(0);
    }
    
    button.secondary { 
      background: #24304d; 
    }
    
    button.danger { 
      background: linear-gradient(135deg, #ff3b5c, #e03552); 
    }
    
    button:disabled { 
      opacity: .5; 
      cursor: not-allowed; 
      transform: none !important;
      box-shadow: none !important;
    }
    
    .row { 
      display: flex; 
      gap: 12px; 
      align-items: center;
    }
    
    .row > * { 
      flex: 1; 
    }
    
    .pill { 
      display: inline-block; 
      padding: 8px 14px; 
      border-radius: 999px; 
      background: rgba(255, 255, 255, .08); 
      font-size: 13px; 
      font-weight: 600;
      margin: 4px 0;
    }
    
    .big { 
      font-size: 28px; 
      font-weight: 800; 
      margin: 8px 0;
      background: linear-gradient(135deg, #e7eefc, #a0b6ff);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }
    
    .ayah { 
      font-size: 32px; 
      line-height: 1.8; 
      text-align: right; 
      margin: 20px 0;
      font-family: "Traditional Arabic", "Scheherazade", serif;
      color: #ffffff;
      min-height: 120px;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    
    .trans { 
      margin-top: 16px; 
      font-size: 16px; 
      line-height: 1.6; 
      opacity: .92;
      padding: 12px;
      background: rgba(11, 18, 32, 0.5);
      border-radius: 10px;
    }
    
    .roman { 
      margin-top: 12px; 
      font-size: 15px; 
      opacity: .82; 
      font-style: italic;
      color: #a0b6ff;
    }
    
    .toast { 
      position: fixed; 
      left: 50%; 
      transform: translateX(-50%); 
      bottom: 24px; 
      background: #0f1a31; 
      border: 1px solid rgba(255, 255, 255, .12); 
      padding: 14px 20px; 
      border-radius: 14px; 
      max-width: 360px; 
      width: calc(100% - 48px); 
      display: none;
      z-index: 1000;
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
      animation: slideUp 0.3s ease;
      text-align: center;
      font-weight: 500;
    }
    
    @keyframes slideUp {
      from {
        transform: translateX(-50%) translateY(20px);
        opacity: 0;
      }
      to {
        transform: translateX(-50%) translateY(0);
        opacity: 1;
      }
    }
    
    .progress-bar {
      height: 6px;
      background: rgba(255, 255, 255, 0.1);
      border-radius: 3px;
      margin: 16px 0;
      overflow: hidden;
    }
    
    .progress-fill {
      height: 100%;
      background: linear-gradient(90deg, #2c5cff, #00c6ff);
      border-radius: 3px;
      transition: width 0.3s ease;
    }
    
    .loading {
      display: inline-block;
      width: 20px;
      height: 20px;
      border: 3px solid rgba(255, 255, 255, 0.1);
      border-radius: 50%;
      border-top-color: #2c5cff;
      animation: spin 1s ease-in-out infinite;
      margin-right: 10px;
      vertical-align: middle;
    }
    
    @keyframes spin {
      to { transform: rotate(360deg); }
    }
    
    .stats-grid {
      display: grid;
      grid-template-columns: repeat(2, 1fr);
      gap: 16px;
      margin: 16px 0;
    }
    
    .stat-item {
      text-align: center;
      padding: 16px;
      background: rgba(11, 18, 32, 0.5);
      border-radius: 12px;
      border: 1px solid rgba(255, 255, 255, 0.05);
    }
    
    .stat-label {
      font-size: 13px;
      opacity: 0.7;
      margin-bottom: 8px;
    }
    
    .stat-value {
      font-size: 24px;
      font-weight: 700;
      color: #ffffff;
    }
    
    .verse-info {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 16px;
      padding-bottom: 12px;
      border-bottom: 1px solid rgba(255, 255, 255, 0.08);
    }
    
    .verse-count {
      font-size: 14px;
      opacity: 0.8;
    }
    
    .timer {
      font-size: 14px;
      color: #2c5cff;
      font-weight: 600;
    }
    
    .checkbox-container {
      display: flex;
      align-items: center;
      margin: 12px 0;
      cursor: pointer;
    }
    
    .checkbox-container input {
      width: auto;
      margin-right: 10px;
      transform: scale(1.2);
    }
    
    .back-button {
      display: flex;
      align-items: center;
      gap: 8px;
      margin-bottom: 16px;
      color: #a0b6ff;
      cursor: pointer;
      font-size: 14px;
    }
    
    .back-button:hover {
      opacity: 0.8;
    }
  </style>
</head>
<body>
  <div class="wrap" id="app">
    <!-- App content will be rendered here -->
  </div>
  
  <div class="toast" id="toast"></div>

  <script>
    // State management
    const store = {
      token: localStorage.getItem('surea_token') || '',
      me: null,
      reading: {
        sessionId: '',
        verse: null,
        count: 0,
        startedAt: 0,
        verseShownAt: 0
      }
    };

    // Toast notification system
    function toast(msg, duration = 2200) {
      const el = document.getElementById('toast');
      el.textContent = msg;
      el.style.display = 'block';
      setTimeout(() => {
        el.style.display = 'none';
      }, duration);
    }

    // API call wrapper
    function call(fn, payload = {}) {
      return new Promise((resolve, reject) => {
        if (typeof google !== 'undefined' && google.script && google.script.run) {
          google.script.run
            .withSuccessHandler(resolve)
            .withFailureHandler(err => {
              console.error('API Error:', err);
              reject(err);
            })
            [fn](payload);
        } else {
          // Mock for testing without Google Apps Script
          setTimeout(() => {
            resolve(mockApiResponse(fn, payload));
          }, 500);
        }
      });
    }

    // Mock API responses for testing
    function mockApiResponse(fn, payload) {
      console.log('Mock API Call:', fn, payload);
      
      switch(fn) {
        case 'api_login':
          if (payload.email && payload.password) {
            return {
              ok: true,
              token: 'mock-token-' + Date.now(),
              user: { email: payload.email }
            };
          }
          return { ok: false, error: 'Invalid credentials' };
          
        case 'api_signup':
          if (payload.email && payload.password && payload.password.length >= 8) {
            return {
              ok: true,
              token: 'mock-token-' + Date.now(),
              user: { email: payload.email }
            };
          }
          return { ok: false, error: 'Signup failed' };
          
        case 'api_getMe':
          if (payload.token && payload.token.startsWith('mock-token')) {
            return {
              ok: true,
              today: new Date().toISOString().split('T')[0],
              user: {
                email: 'user@example.com',
                displayName: 'Test User',
                gender: 'M',
                totalAyat: 150,
                currentStreak: 7,
                totalXp: 1250,
                tier: 'Gold',
                multiplier: 1.5,
                lastChapter: 2,
                lastAyah: 15,
                lastReadDate: new Date().toISOString().split('T')[0],
                menstrualActive: false,
                menstrualDay: 0,
                sideQuestDoneToday: false
              }
            };
          }
          return { ok: false, error: 'Invalid token' };
          
        case 'api_readingStart':
          return {
            ok: true,
            sessionId: 'mock-session-' + Date.now(),
            verse: {
              arabic: 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
              translation: 'In the name of Allah, the Most Gracious, the Most Merciful.',
              transliteration: 'Bismillāhir-Raḥmānir-Raḥīm',
              ayahKey: '1:1'
            }
          };
          
        case 'api_readingNext':
          const verses = [
            {
              arabic: 'الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
              translation: 'All praise is due to Allah, Lord of all the worlds.',
              transliteration: 'Al-Ḥamdu lillāhi Rabbi l-ʿālamīn',
              ayahKey: '1:2'
            },
            {
              arabic: 'الرَّحْمَٰنِ الرَّحِيمِ',
              translation: 'The Most Gracious, the Most Merciful.',
              transliteration: 'Ar-Raḥmānir-Raḥīm',
              ayahKey: '1:3'
            }
          ];
          return {
            ok: true,
            verse: verses[Math.floor(Math.random() * verses.length)]
          };
          
        case 'api_readingDone':
          return {
            ok: true,
            ayatCount: Math.floor(Math.random() * 10) + 1,
            xpGained: Math.floor(Math.random() * 50) + 10
          };
          
        default:
          return { ok: true, message: 'Mock response for ' + fn };
      }
    }

    // Token management
    function setToken(t) {
      store.token = t || '';
      if (store.token) {
        localStorage.setItem('surea_token', store.token);
      } else {
        localStorage.removeItem('surea_token');
      }
    }

    // DOM utility functions
    function el(html) {
      const template = document.createElement('template');
      template.innerHTML = html.trim();
      return template.content.firstChild;
    }

    function render(node) {
      const app = document.getElementById('app');
      app.innerHTML = '';
      app.appendChild(node);
    }

    function escapeHtml(text) {
      const div = document.createElement('div');
      div.textContent = text;
      return div.innerHTML;
    }

    // Loading screens
    function renderLoading(title = 'Loading…', subtitle = 'Please wait') {
      render(el(`
        <div>
          <div class="card">
            <div style="display: flex; align-items: center; margin-bottom: 16px;">
              <div class="loading"></div>
              <h2>${escapeHtml(title)}</h2>
            </div>
            <div class="muted">${escapeHtml(subtitle)}</div>
            <div class="progress-bar">
              <div class="progress-fill" style="width: 60%"></div>
            </div>
          </div>
        </div>
      `));
    }

    function renderReadingLoading(msg = 'Loading ayat…') {
      render(el(`
        <div>
          <div class="card">
            <div style="display: flex; align-items: center; margin-bottom: 16px;">
              <div class="loading"></div>
              <h2>Reading Session</h2>
            </div>
            <div class="muted">${escapeHtml(msg)}</div>
            <div style="height:20px"></div>
            <div class="progress-bar">
              <div class="progress-fill" style="width: 80%"></div>
            </div>
            <div style="height:20px"></div>
            <span class="pill">Fetching verses…</span>
          </div>
        </div>
      `));
    }

    // Helper functions
    function nameFallback(email) {
      if (!email) return 'Kawan';
      const part = (email.split('@')[0] || 'kawan');
      return part.slice(0, 1).toUpperCase() + part.slice(1);
    }

    function formatDate(dateStr) {
      if (!dateStr) return '';
      const date = new Date(dateStr);
      return date.toLocaleDateString('en-MY', {
        day: 'numeric',
        month: 'short',
        year: 'numeric'
      });
    }

    // Main application boot
    async function boot() {
      renderLoading('Loading…', 'Fetching your progress');

      if (!store.token) {
        renderLogin();
        return;
      }

      try {
        const res = await call('api_getMe', { token: store.token });
        if (!res.ok) {
          setToken('');
          renderLogin();
          return;
        }

        store.me = res;

        // Check onboarding steps
        const g = (res.user.gender || '').trim();
        const dn = (res.user.displayName || '').trim();
        
        if (!g) {
          renderGender();
          return;
        }
        
        if (!dn) {
          renderDisplayName();
          return;
        }

        renderDashboard();
      } catch (error) {
        console.error('Boot error:', error);
        toast('Network error. Please try again.');
        setTimeout(boot, 2000);
      }
    }

    // Authentication Screens
    function renderLogin() {
      const node = el(`
        <div>
          <div class="card" style="text-align: center;">
            <h1 style="font-size: 32px; margin-bottom: 8px;">📖</h1>
            <h1>Surea</h1>
            <div class="muted">Quran Reading Companion</div>
            <div style="height: 20px"></div>
            <div class="pill">Login dengan email</div>
            <div class="muted">Auto-remember login</div>
          </div>

          <div class="card">
            <h2>Log Masuk</h2>
            <input id="lemail" placeholder="Email" inputmode="email" autocomplete="email" />
            <input id="lpass" placeholder="Kata Laluan" type="password" autocomplete="current-password" />
            <button id="lbtn">Log Masuk</button>
            <div style="height: 10px"></div>
            <button class="secondary" id="toSignup">Buat Akaun Baru</button>
          </div>
          
          <div class="card" style="text-align: center;">
            <div class="muted">"Dan bacalah Al-Quran dengan tartil."</div>
            <div class="muted" style="font-size: 13px;">(Al-Muzzammil 73:4)</div>
          </div>
        </div>
      `);

      node.querySelector('#lbtn').onclick = async () => {
        const btn = node.querySelector('#lbtn');
        const email = node.querySelector('#lemail').value.trim();
        const password = node.querySelector('#lpass').value;

        if (!email || !password) {
          toast('Sila isi email dan kata laluan');
          return;
        }

        btn.disabled = true;
        btn.innerHTML = '<div class="loading"></div>Logging in…';

        try {
          const res = await call('api_login', { email, password });
          if (!res.ok) {
            toast(res.error || 'Login gagal');
            btn.disabled = false;
            btn.textContent = 'Log Masuk';
            return;
          }

          setToken(res.token);
          toast('Login berjaya!');
          setTimeout(boot, 1000);
        } catch (error) {
          toast('Ralat rangkaian');
          btn.disabled = false;
          btn.textContent = 'Log Masuk';
        }
      };

      node.querySelector('#toSignup').onclick = () => renderSignup();
      
      // Enter key support
      node.querySelector('#lpass').addEventListener('keypress', (e) => {
        if (e.key === 'Enter') {
          node.querySelector('#lbtn').click();
        }
      });

      render(node);
      node.querySelector('#lemail').focus();
    }

    function renderSignup() {
      const node = el(`
        <div>
          <div class="back-button" id="backToLogin">
            ← Kembali ke Login
          </div>
          
          <div class="card">
            <h2>Buat Akaun Baru</h2>
            <div class="muted">Mula perjalanan bacaan Quran anda</div>
            <div style="height: 20px"></div>
            
            <input id="semail" placeholder="Email" inputmode="email" autocomplete="email" />
            <input id="spass" placeholder="Kata Laluan (min 8 aksara)" type="password" autocomplete="new-password" />
            <input id="spass2" placeholder="Ulang Kata Laluan" type="password" />
            
            <button id="sbtn">Daftar</button>
          </div>
          
          <div class="card">
            <h3>Keistimewaan Surea</h3>
            <div class="muted">✓ Jejak kemajuan bacaan</div>
            <div class="muted">✓ Sistem streak harian</div>
            <div class="muted">✓ Sistem XP dan tier</div>
            <div class="muted">✓ Pause haid untuk wanita</div>
            <div class="muted">✓ Side quest semasa pause</div>
          </div>
        </div>
      `);

      node.querySelector('#sbtn').onclick = async () => {
        const btn = node.querySelector('#sbtn');
        const email = node.querySelector('#semail').value.trim();
        const password = node.querySelector('#spass').value;
        const password2 = node.querySelector('#spass2').value;

        if (!email || !password) {
          toast('Sila isi semua maklumat');
          return;
        }

        if (password.length < 8) {
          toast('Kata laluan mesti 8 aksara atau lebih');
          return;
        }

        if (password !== password2) {
          toast('Kata laluan tidak sama');
          return;
        }

        btn.disabled = true;
        btn.innerHTML = '<div class="loading"></div>Mendaftar…';

        try {
          const res = await call('api_signup', { email, password });
          if (!res.ok) {
            toast(res.error || 'Pendaftaran gagal');
            btn.disabled = false;
            btn.textContent = 'Daftar';
            return;
          }

          setToken(res.token);
          toast('Pendaftaran berjaya!');
          setTimeout(boot, 1000);
        } catch (error) {
          toast('Ralat rangkaian');
          btn.disabled = false;
          btn.textContent = 'Daftar';
        }
      };

      node.querySelector('#backToLogin').onclick = () => renderLogin();
      
      // Enter key support
      node.querySelector('#spass2').addEventListener('keypress', (e) => {
        if (e.key === 'Enter') {
          node.querySelector('#sbtn').click();
        }
      });

      render(node);
      node.querySelector('#semail').focus();
    }

    // Onboarding Screens
    function renderGender() {
      const node = el(`
        <div>
          <div class="card">
            <h2>🌙 Selamat Datang</h2>
            <div class="muted">Langkah pertama untuk setup akaun</div>
            <div style="height: 30px"></div>
            
            <h3>Pilih Jantina</h3>
            <div class="muted">Untuk sistem pause haid (bagi wanita)</div>
            <div style="height: 20px"></div>
            
            <div class="row">
              <button id="m" class="secondary" style="padding: 20px; font-size: 18px;">
                👨 Lelaki
              </button>
              <button id="f" class="secondary" style="padding: 20px; font-size: 18px;">
                👩 Perempuan
              </button>
            </div>
            
            <div style="height: 30px"></div>
            <div class="muted" style="font-size: 13px;">
              Nota: Pilihan jantina boleh dikemas kini kemudian melalui settings.
            </div>
          </div>
          
          <div class="card">
            <button class="danger" id="logout">
              Log Keluar
            </button>
          </div>
        </div>
      `);

      node.querySelector('#m').onclick = async () => {
        const btn = node.querySelector('#m');
        btn.disabled = true;
        btn.innerHTML = '<div class="loading"></div>Menyimpan…';
        
        try {
          const res = await call('api_setGender', { token: store.token, gender: 'M' });
          if (!res.ok) {
            toast(res.error || 'Gagal menyimpan');
            btn.disabled = false;
            btn.textContent = '👨 Lelaki';
            return;
          }
          boot();
        } catch (error) {
          toast('Ralat rangkaian');
          btn.disabled = false;
          btn.textContent = '👨 Lelaki';
        }
      };

      node.querySelector('#f').onclick = async () => {
        const btn = node.querySelector('#f');
        btn.disabled = true;
        btn.innerHTML = '<div class="loading"></div>Menyimpan…';
        
        try {
          const res = await call('api_setGender', { token: store.token, gender: 'F' });
          if (!res.ok) {
            toast(res.error || 'Gagal menyimpan');
            btn.disabled = false;
            btn.textContent = '👩 Perempuan';
            return;
          }
          boot();
        } catch (error) {
          toast('Ralat rangkaian');
          btn.disabled = false;
          btn.textContent = '👩 Perempuan';
        }
      };

      node.querySelector('#logout').onclick = async () => {
        await call('api_logout', { token: store.token });
        setToken('');
        renderLogin();
      };

      render(node);
    }

    function renderDisplayName() {
      const email = store.me?.user?.email || '';
      const suggestedName = nameFallback(email);

      const node = el(`
        <div>
          <div class="card">
            <h2>Apa nama panggilan anda?</h2>
            <div class="muted">Nama ini untuk display di dashboard sahaja (bukan untuk login)</div>
            <div style="height: 30px"></div>
            
            <input 
              id="dn" 
              placeholder="Contoh: ${suggestedName}" 
              value="${suggestedName}"
              autocomplete="name"
            />
            
            <div style="height: 20px"></div>
            
            <button id="save">Teruskan</button>
          </div>
          
          <div class="card">
            <div class="muted" style="font-size: 13px;">
              💡 Anda boleh tukar nama ini kemudian melalui settings.
            </div>
          </div>
        </div>
      `);

      node.querySelector('#save').onclick = async () => {
        const btn = node.querySelector('#save');
        const displayName = node.querySelector('#dn').value.trim();

        if (!displayName) {
          toast('Sila masukkan nama panggilan');
          return;
        }

        btn.disabled = true;
        btn.innerHTML = '<div class="loading"></div>Menyimpan…';

        try {
          const res = await call('api_setDisplayName', { token: store.token, displayName });
          if (!res.ok) {
            toast(res.error || 'Gagal menyimpan');
            btn.disabled = false;
            btn.textContent = 'Teruskan';
            return;
          }
          boot();
        } catch (error) {
          toast('Ralat rangkaian');
          btn.disabled = false;
          btn.textContent = 'Teruskan';
        }
      };

      // Enter key support
      node.querySelector('#dn').addEventListener('keypress', (e) => {
        if (e.key === 'Enter') {
          node.querySelector('#save').click();
        }
      });

      render(node);
      node.querySelector('#dn').select();
    }

    // Main Dashboard
    function renderDashboard() {
      const u = store.me.user;
      const today = store.me.today;
      const greetName = u.displayName?.trim() || nameFallback(u.email);
      
      const lastRef = `${u.lastChapter || 1}:${u.lastAyah || 1}`;
      const hasProgress = (u.totalAyat > 0);
      const readLabel = hasProgress ? 'Teruskan Bacaan' : 'Mula Baca';
      
      const streakStatus = u.menstrualActive
        ? `<span class="pill" style="background: rgba(255, 59, 92, 0.15); color: #ff8fa3;">⏸️ Streak Paused • Day ${u.menstrualDay}/9</span>`
        : (u.lastReadDate === today 
            ? `<span class="pill" style="background: rgba(46, 204, 113, 0.15); color: #2ecc71;">✅ Streak Lengkap Hari Ini</span>`
            : `<span class="pill" style="background: rgba(255, 193, 7, 0.15); color: #ffc107;">📖 Belum Lengkap Hari Ini</span>`);
      
      const readBtnDisabled = u.menstrualActive ? 'disabled' : '';
      const readHint = u.menstrualActive
        ? `<div class="muted" style="margin-top:12px; color: #ff8fa3;">⏸️ Bacaan tidak dibenarkan semasa pause haid.</div>`
        : `<div class="muted" style="margin-top:12px;">Terakhir: ${escapeHtml(lastRef)}</div>`;
      
      const menstrualCard = (u.gender === 'F') ? `
        <div class="card">
          <h3>⚪️ Pause Haid</h3>
          ${u.menstrualActive
            ? `<div class="muted">Status: Aktif (Hari ${u.menstrualDay}/9)</div>
               <div style="height:12px"></div>
               <button class="danger" id="pauseOff">Hentikan Pause Haid</button>`
            : `<div class="muted">Status: Tidak Aktif</div>
               <div style="height:12px"></div>
               <button class="secondary" id="pauseOn">Aktifkan Pause Haid</button>`}
          <div class="muted" style="margin-top:12px; font-size:13px;">
            Maksimum 9 hari. 1 kitaran setiap 28 hari.
          </div>
        </div>
      ` : '';
      
      const sideQuestCard = u.menstrualActive ? `
        <div class="card">
          <h3>🎯 Side Quest (Pilihan)</h3>
          <div class="muted">Dapatkan XP 1x sehari semasa pause haid</div>
          <div style="height:20px"></div>
          
          <div class="checkbox-container">
            <input type="checkbox" id="sqcheck" ${u.sideQuestDoneToday ? 'checked disabled' : ''}/>
            <label for="sqcheck" class="muted">
              Saya telah melakukan amalan ringkas hari ini (zikir, sedekah, dll)
            </label>
          </div>
          
          <div style="height:12px"></div>
          
          <button id="sqbtn" ${u.sideQuestDoneToday ? 'disabled' : ''}>
            ${u.sideQuestDoneToday ? '✅ Selesai Hari Ini' : 'Selesaikan Side Quest'}
          </button>
          
          ${u.sideQuestDoneToday 
            ? `<div class="muted" style="margin-top:12px; color: #2ecc71;">Anda telah dapat XP hari ini!</div>` 
            : `<div class="muted" style="margin-top:12px;">Dapatkan bonus XP dengan amalan ringkas</div>`}
        </div>
      ` : '';

      const node = el(`
        <div>
          <!-- Header -->
          <div class="card">
            <div class="muted">📅 ${formatDate(today) || today}</div>
            <div class="big">Assalamualaikum, ${escapeHtml(greetName)}</div>
            <div style="height:16px"></div>
            ${streakStatus}
          </div>

          <!-- Stats Grid -->
          <div class="card">
            <div class="stats-grid">
              <div class="stat-item">
                <div class="stat-label">Total Ayat</div>
                <div class="stat-value">${u.totalAyat}</div>
              </div>
              <div class="stat-item">
                <div class="stat-label">Current Streak</div>
                <div class="stat-value">${u.currentStreak}</div>
              </div>
              <div class="stat-item">
                <div class="stat-label">Total XP</div>
                <div class="stat-value">${u.totalXp}</div>
              </div>
              <div class="stat-item">
                <div class="stat-label">Tier</div>
                <div class="stat-value">${u.tier}</div>
                <div class="stat-label">Multiplier: x${u.multiplier}</div>
              </div>
            </div>
          </div>

          <!-- Reading Section -->
          <div class="card">
            <h3>📖 Al-Quran</h3>
            <button id="read" ${readBtnDisabled} style="font-size: 18px; padding: 18px;">
              ${readLabel}
            </button>
            ${readHint}
          </div>

          ${sideQuestCard}
          ${menstrualCard}

          <!-- Actions -->
          <div class="card">
            <button class="secondary" id="refresh">
              🔄 Refresh
            </button>
            <div style="height:12px"></div>
            <button class="danger" id="logout">
              Log Keluar
            </button>
          </div>
        </div>
      `);

      // Event listeners
      node.querySelector('#refresh').onclick = () => boot();
      
      node.querySelector('#logout').onclick = async () => {
        await call('api_logout', { token: store.token });
        setToken('');
        renderLogin();
      };
      
      node.querySelector('#read').onclick = () => startReadingFromProgress();
      
      // Menstrual pause handlers
      if (u.gender === 'F') {
        if (u.menstrualActive) {
          const offBtn = node.querySelector('#pauseOff');
          if (offBtn) {
            offBtn.onclick = async () => {
              offBtn.disabled = true;
              offBtn.innerHTML = '<div class="loading"></div>Memproses…';
              
              try {
                const res = await call('api_menstrualDeactivate', { token: store.token });
                if (!res.ok) {
                  toast(res.error || 'Gagal');
                  offBtn.disabled = false;
                  offBtn.textContent = 'Hentikan Pause Haid';
                  return;
                }
                toast('Pause haid dihentikan');
                boot();
              } catch (error) {
                toast('Ralat rangkaian');
                offBtn.disabled = false;
                offBtn.textContent = 'Hentikan Pause Haid';
              }
            };
          }
        } else {
          const onBtn = node.querySelector('#pauseOn');
          if (onBtn) {
            onBtn.onclick = async () => {
              onBtn.disabled = true;
              onBtn.innerHTML = '<div class="loading"></div>Memproses…';
              
              try {
                const res = await call('api_menstrualActivate', { token: store.token });
                if (!res.ok) {
                  toast(res.error || 'Gagal');
                  onBtn.disabled = false;
                  onBtn.textContent = 'Aktifkan Pause Haid';
                  return;
                }
                toast('Pause haid diaktifkan');
                boot();
              } catch (error) {
                toast('Ralat rangkaian');
                onBtn.disabled = false;
                onBtn.textContent = 'Aktifkan Pause Haid';
              }
            };
          }
        }
      }
      
      // Side quest handler
      if (u.menstrualActive) {
        const sqBtn = node.querySelector('#sqbtn');
        if (sqBtn && !u.sideQuestDoneToday) {
          sqBtn.onclick = async () => {
            const checked = node.querySelector('#sqcheck').checked;
            if (!checked) {
              toast('Sila tick checkbox dahulu');
              return;
            }
            
            sqBtn.disabled = true;
            sqBtn.innerHTML = '<div class="loading"></div>Memproses…';
            
            try {
              const res = await call('api_sideQuestComplete', { token: store.token });
              if (!res.ok) {
                toast(res.error || 'Gagal');
                sqBtn.disabled = false;
                sqBtn.textContent = 'Selesaikan Side Quest';
                return;
              }
              toast(`✅ +${res.xpGained} XP diperolehi!`);
              boot();
            } catch (error) {
              toast('Ralat rangkaian');
              sqBtn.disabled = false;
              sqBtn.textContent = 'Selesaikan Side Quest';
            }
          };
        }
      }

      render(node);
    }

    // Reading Session Functions
    async function startReadingFromProgress() {
      renderReadingLoading('Menyediakan bacaan…');
      
      try {
        const res = await call('api_readingStart', { token: store.token });
        if (!res.ok) {
          toast(res.error || 'Gagal memulakan bacaan');
          boot();
          return;
        }

        store.reading.sessionId = res.sessionId;
        store.reading.verse = res.verse;
        store.reading.count = 1;
        store.reading.startedAt = Date.now();
        store.reading.verseShownAt = Date.now();
        
        renderReading();
      } catch (error) {
        toast('Ralat rangkaian');
        boot();
      }
    }

    function renderReading() {
      const v = store.reading.verse;
      const minMs = 3000; // Minimum 3 seconds per verse
      const elapsed = Date.now() - store.reading.verseShownAt;
      const canPress = elapsed >= minMs;
      const remainingSec = Math.max(0, Math.ceil((minMs - elapsed) / 1000));
      
      const timerText = canPress 
        ? '✅ Sedia untuk next' 
        : `⏳ Tunggu ${remainingSec}s`;

      const node = el(`
        <div>
          <div class="back-button" id="backToDashboard">
            ← Kembali ke Dashboard
          </div>
          
          <div class="card">
            <div class="verse-info">
              <div class="verse-count">
                📖 Ayat ${store.reading.count}
              </div>
              <div class="timer">
                ${timerText}
              </div>
            </div>
            
            <div class="muted" style="text-align: center; font-size: 15px;">
              ${escapeHtml(v.ayahKey || '')}
            </div>
            
            <div class="ayah">
              ${v.arabic || '<div style="color: #666; text-align: center;">Loading ayat…</div>'}
            </div>
            
            <div class="trans">
              ${escapeHtml(v.translation || 'Loading translation…')}
            </div>
            
            <div class="roman">
              ${escapeHtml(v.transliteration || '')}
            </div>
            
            <div class="progress-bar">
              <div class="progress-fill" style="width: ${Math.min(100, (elapsed / minMs) * 100)}%"></div>
            </div>
          </div>

          <div class="card">
            <button id="next" ${canPress ? '' : 'disabled'}>
              ${canPress ? '⏭️ Next Ayat' : '⏳ Please wait…'}
            </button>
            
            <div style="height:12px"></div>
            
            <button id="done" class="secondary" ${canPress ? '' : 'disabled'}>
              ✅ Selesai Baca
            </button>
            
            <div class="muted" style="margin-top:16px; text-align: center;">
              Baca dengan khusyuk. Button akan unlock selepas 3 saat.
            </div>
          </div>
        </div>
      `);

      // Timer update interval
      let timerInterval;
      if (!canPress) {
        timerInterval = setInterval(() => {
          const elapsed = Date.now() - store.reading.verseShownAt;
          const remainingSec = Math.max(0, Math.ceil((minMs - elapsed) / 1000));
          
          const timerEl = node.querySelector('.timer');
          if (timerEl) {
            timerEl.textContent = remainingSec > 0 
              ? `⏳ Tunggu ${remainingSec}s` 
              : '✅ Sedia untuk next';
          }
          
          const progressEl = node.querySelector('.progress-fill');
          if (progressEl) {
            progressEl.style.width = `${Math.min(100, (elapsed / minMs) * 100)}%`;
          }
          
          if (elapsed >= minMs) {
            clearInterval(timerInterval);
            const nextBtn = node.querySelector('#next');
            const doneBtn = node.querySelector('#done');
            if (nextBtn) nextBtn.disabled = false;
            if (doneBtn) doneBtn.disabled = false;
            if (nextBtn) nextBtn.textContent = '⏭️ Next Ayat';
          }
        }, 100);
      }

      // Navigation handlers
      node.querySelector('#backToDashboard').onclick = () => {
        if (timerInterval) clearInterval(timerInterval);
        boot();
      };

      node.querySelector('#next').onclick = async () => {
        if (timerInterval) clearInterval(timerInterval);
        renderReadingLoading('Mengambil ayat seterusnya…');
        
        try {
          const res = await call('api_readingNext', { 
            token: store.token, 
            sessionId: store.reading.sessionId 
          });
          
          if (!res.ok) {
            toast(res.error || 'Gagal mengambil ayat seterusnya');
            boot();
            return;
          }
          
          store.reading.verse = res.verse;
          store.reading.count += 1;
          store.reading.verseShownAt = Date.now();
          renderReading();
        } catch (error) {
          toast('Ralat rangkaian');
          boot();
        }
      };

      node.querySelector('#done').onclick = async () => {
        if (timerInterval) clearInterval(timerInterval);
        renderReadingLoading('Menyimpan kemajuan…');
        
        try {
          const res = await call('api_readingDone', { 
            token: store.token, 
            sessionId: store.reading.sessionId 
          });
          
          if (!res.ok) {
            toast(res.error || 'Gagal menyimpan');
            renderReading();
            return;
          }
          
          toast(`✅ ${res.ayatCount} ayat dibaca • +${res.xpGained} XP`);
          setTimeout(() => boot(), 1500);
        } catch (error) {
          toast('Ralat rangkaian');
          boot();
        }
      };

      render(node);
      
      // Clean up interval on unmount
      node._cleanup = () => {
        if (timerInterval) clearInterval(timerInterval);
      };
    }

    // Initialize app
    document.addEventListener('DOMContentLoaded', () => {
      // Check if running in Google Apps Script environment
      if (typeof google === 'undefined' || !google.script || !google.script.run) {
        console.log('Running in standalone mode (mock data)');
        toast('Demo Mode: Using mock data', 3000);
      }
      
      boot();
    });

    // Add some global error handling
    window.addEventListener('error', (event) => {
      console.error('Global error:', event.error);
      toast('Terjadi ralat. Sila refresh page.');
    });

    window.addEventListener('unhandledrejection', (event) => {
      console.error('Unhandled promise rejection:', event.reason);
      toast('Ralat sistem. Sila refresh page.');
    });
  </script>
</body>
</html>
