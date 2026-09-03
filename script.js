const radarWrap = document.getElementById('radar-wrap');
const speedEl   = document.getElementById('speedVal');
const speedUnit = document.getElementById('speedUnit');
const distEl    = document.getElementById('distVal');
const distUnit  = document.getElementById('distUnit');
const alertText = document.getElementById('alertText');
const pwrLed    = document.getElementById('pwrLed');

const ALERT_KMH = 80;
const ALERT_MPH = 50;

function setAlert(isAlert) {
    speedEl.classList.toggle('alert', isAlert);
    pwrLed.classList.toggle('alert', isAlert);
    alertText.classList.toggle('visible', isAlert);
    alertText.textContent = isAlert ? '!! EXCESSO !!' : '';
}

window.addEventListener('message', function(event) {
    let data;
    try {
        data = typeof event.data === 'string' ? JSON.parse(event.data) : event.data;
    } catch(e) { return; }

    if (!data) return;

    // Toggle visibilidade
    if (data.action === 'toggle') {
        radarWrap.classList.toggle('hidden', !data.visible);

        if (data.visible) {
            pwrLed.classList.add('on');
        } else {
            pwrLed.classList.remove('on', 'alert');
            speedEl.textContent = '---';
            distEl.textContent  = '--.-';
            speedEl.classList.remove('alert');
            alertText.classList.remove('visible');
        }
        return;
    }

    // Atualiza dados
    if (data.action === 'update') {
        const speed = parseFloat(data.SPEED)    || 0;
        const dist  = parseFloat(data.DISTANCE) || 0;
        const sUnit = data.SPEED_UNIT    || 'KMH';
        const dUnit = data.DISTANCE_UNIT || 'M';

        speedEl.textContent   = speed.toFixed(0);
        speedUnit.textContent = sUnit;
        distEl.textContent    = dist.toFixed(1);
        distUnit.textContent  = dUnit;

        const threshold = (sUnit === 'MPH') ? ALERT_MPH : ALERT_KMH;
        setAlert(speed > 0 && speed >= threshold);
    }
});

// ── TOAST DE NOTIFICAÇÃO ──────────────────────────────────────────────────────
function showToast(msg, isError) {
    let toast = document.getElementById('radar-toast');
    if (!toast) {
        toast = document.createElement('div');
        toast.id = 'radar-toast';
        toast.style.cssText = `
            position: fixed;
            bottom: 14px;
            left: 50%;
            transform: translateX(-50%);
            background: rgba(10,10,10,0.92);
            border: 1px solid #333;
            border-radius: 4px;
            padding: 5px 12px;
            font-family: 'Share Tech Mono', monospace;
            font-size: 10px;
            letter-spacing: 1px;
            pointer-events: none;
            transition: opacity 0.3s;
            z-index: 9999;
        `;
        document.body.appendChild(toast);
    }

    toast.style.color      = isError ? '#ff4444' : '#aaff00';
    toast.style.borderColor = isError ? '#ff2222' : '#558800';
    toast.textContent      = msg;
    toast.style.opacity    = '1';

    clearTimeout(toast._timeout);
    toast._timeout = setTimeout(() => { toast.style.opacity = '0'; }, 3000);
}

// Escuta notificações do client.lua
const _origListener = window.onmessage;
window.addEventListener('message', function(event) {
    let data;
    try { data = typeof event.data === 'string' ? JSON.parse(event.data) : event.data; }
    catch(e) { return; }
    if (data && data.action === 'notify') {
        showToast(data.msg, data.isError || false);
    }
});