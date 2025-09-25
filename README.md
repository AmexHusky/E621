Alles klar 🙌 ich schreibe dir ein neues **README.md**, das sofort in dein Repo passt, leicht verständlich ist und wie von dir persönlich klingt.

---

## 📄 Neues `README.md`

````markdown
# 🦊 E621 Installer

Willkommen bei **E621**, meinem kleinen All-in-One-Installer.  
Mit diesem Tool kannst du wichtige Kern-Programme, Zusatz-Tools oder gleich alles zusammen auf deinem System installieren – wahlweise direkt im Terminal oder über eine einfache grafische Oberfläche.

---

## 🚀 Installation

Zuerst klonst du das Repository:

```bash
git clone https://github.com/AmexHusky/E621.git
cd E621
````

Dann startest du die Installation mit:

```bash
sudo bash install_e621.sh -a
```

Danach kannst du das Tool überall im System mit dem Befehl `E621` aufrufen.

---

## 🛠️ Verwendung

### Terminal-Optionen

```bash
sudo E621 -a       # Alles installieren (Core + Extras)
sudo E621 -c       # Nur Kernkomponenten (Git, Python, Pip)
sudo E621 -e       # Nur Zusatztools (Docker, htop, usw.)
sudo E621 -y       # Automatische Standardinstallation (Alles)
sudo E621 --gui    # Starte die grafische Oberfläche
```

### Grafische Oberfläche

Falls du lieber klickst statt tippst:

```bash
sudo E621 --gui
```

Dort kannst du bequem auswählen, welche Pakete du installieren möchtest.
Kein Stress, keine langen Befehle merken. 😉

---

## 📦 Enthaltene Pakete

### Core

* `git`
* `python3`
* `python3-pip`

### Extras

* `docker.io`
* `htop`
* `tmux`
* `curl`
* `wget`
* `build-essential`

---

## 📝 Hinweis

* Das Script richtet sich an **Debian/Ubuntu-basierte Systeme**.
* Es wird automatisch ein Symlink erstellt:
  `E621` → `/usr/local/bin/E621`
* Damit kannst du den Installer systemweit nutzen.

---

## ❤️ Von mir für euch

Ich baue das hier in meiner Freizeit – für mich, meine Projekte und alle, die sowas praktisch finden.
Probier’s aus, geb mir gern Feedback oder Ideen für weitere Tools!
