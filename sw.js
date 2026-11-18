const CACHE='smartstudy-v16-correct-developer-photos';
const ASSETS=['./','./index.html','./style.css','./app.js','./supabase-config.js','./manifest.json','./icons/icon.svg','./icons/icon-192.png','./icons/icon-512.png','./icons/install.svg','./assets/developer-1.svg','./assets/developer-2.svg','./assets/fajar.jpeg','./assets/natanael.jpeg'];
self.addEventListener('install',event=>event.waitUntil(caches.open(CACHE).then(cache=>cache.addAll(ASSETS))));
self.addEventListener('activate',event=>event.waitUntil(caches.keys().then(keys=>Promise.all(keys.filter(key=>key!==CACHE).map(key=>caches.delete(key))))));
self.addEventListener('fetch',event=>{
  const request=event.request;
  const url=new URL(request.url);
  // Jangan cache endpoint PHP/API atau permintaan lintas origin: respons akun bersifat privat.
  if(request.method!=='GET'||url.origin!==self.location.origin||url.pathname.includes('/api/'))return;
  event.respondWith(caches.match(request).then(cached=>cached||fetch(request).then(response=>{
    if(response.ok){const copy=response.clone();caches.open(CACHE).then(cache=>cache.put(request,copy));}
    return response;
  }).catch(()=>caches.match('./index.html'))));
});
