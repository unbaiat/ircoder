# ClipAI_Word

A Microsoft Word add-in that proofreads and rewrites the text you select, using the AI provider you choose: OpenAI, Claude, Gemini, or Grok. It changes only the words that need changing, so formatting, footnotes, fields, and pictures stay in place.

You need your own API key from one of the providers. The provider bills the usage to your account.

- [Help and support](https://unbaiat.github.io/ircoder/support.html): installation, setup, and troubleshooting
- [Privacy policy](https://unbaiat.github.io/ircoder/privacy.html)
- [Terms of use](https://unbaiat.github.io/ircoder/terms.html)
- [Report a problem or inappropriate AI content](https://github.com/unbaiat/ircoder/issues/new/choose)

## Install

**Windows:** paste this into PowerShell (no administrator rights needed), then restart Word. You can also run [install-windows.cmd](https://unbaiat.github.io/ircoder/install-windows.cmd) instead.

```powershell
$dir = "$env:LOCALAPPDATA\ClipAI_Word"
$key = "HKCU:\Software\Microsoft\Office\16.0\Wef\Developer"
New-Item -ItemType Directory -Force -Path $dir | Out-Null
Invoke-WebRequest "https://unbaiat.github.io/ircoder/manifest.xml" -OutFile "$dir\manifest.xml" -UseBasicParsing
if (-not (Test-Path $key)) { New-Item -Path $key -Force | Out-Null }
New-ItemProperty -Path $key -Name "bfcdbf3e-b664-4722-be3d-ee13fae01b07" -Value "$dir\manifest.xml" -PropertyType String -Force | Out-Null
```

**Mac:** paste this into Terminal, then restart Word.

```bash
mkdir -p ~/Library/Containers/com.microsoft.Word/Data/Documents/wef
curl -fsSL https://unbaiat.github.io/ircoder/manifest.xml -o ~/Library/Containers/com.microsoft.Word/Data/Documents/wef/bfcdbf3e-b664-4722-be3d-ee13fae01b07.manifest.xml
```

**Word on the web:** see the [help page](https://unbaiat.github.io/ircoder/support.html#install).

## Privacy in short

ClipAI_Word has no server and collects no data. Selected text goes directly from your device to the provider you chose, only when you run a command. API keys stay on your device.

## License

GNU Affero General Public License v3. See [LICENSE](LICENSE).

ClipAI_Word is independent and is not affiliated with or endorsed by Microsoft, OpenAI, Anthropic, Google, or xAI.
