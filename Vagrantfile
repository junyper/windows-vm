load './Vagrantbasefile'

Vagrant.configure("2") do |config|
  config.vm.box = "MSEdge-Win10"
  config.vm.box_url = "file://./downloads/MSEdge%20-%20Win10.box"

  config.vm.provider "virtualbox" do |v|
    v.linked_clone = true
    v.name = "win10-chrome-nvda"
    v.customize ["modifyvm", :id, "--vram", "64"]
    v.customize ["setextradata", :id, "GUI/MaxGuestResolution", "any"]
    v.customize ["modifyvm", :id, "--audio", "coreaudio", "--audioout", "on", "--audiocontroller", "hda"]
  end

  config.vm.provision "settings",
    type: "shell",
    inline: <<-SHELL
      Set-ItemProperty -Path 'HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System' -Name EnableLUA -Type DWord -Value 0
      Set-ItemProperty -Path 'HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer' -Name NoTrayItemsDisplay -Type DWord -Value 1
      Set-ItemProperty -Path 'HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon' -Name DefaultUserName -Type String -Value IEUser
      Set-ItemProperty -Path 'HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon' -Name DefaultPassword -Type String -Value 'Passw0rd!'
      Set-ItemProperty -Path 'HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon' -Name AutoAdminLogon -Type String -Value 1
      New-Item -Path 'HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsUpdate' -Name AU -Force
      Set-ItemProperty -Path 'HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsUpdate\\AU' -Name NoAutoUpdate -Type DWord -Value 1
      # allows the mouse to move just after typing:
      Set-ItemProperty -Path 'HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\PrecisionTouchPad' -Name AAPThreshold -Type DWord -Value 0
  SHELL

  config.vm.provision "nvda",
    type: "shell",
    inline: <<-SHELL
      C:\\vagrant\\downloads\\nvda.exe --install-silent --log-level=20 --log-file=C:\\NVDA.log
  SHELL

  config.vm.provision "nvda-config", type: "file", source: "nvda.ini", destination: "C:\\Users\\IEUser\\AppData\\Roaming\\nvda\\nvda.ini"

  config.vm.provision "chrome",
    type: "shell",
    inline: <<-SHELL
      Start-Process C:\\vagrant\\downloads\\chrome_installer.exe -Args "/silent /install" -Verb RunAs -Wait
    SHELL
end
