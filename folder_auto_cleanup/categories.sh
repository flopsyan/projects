#!/usr/bin/env bash


# folder names
EXT_MAP_CAT_IMAGES="Images"
EXT_MAP_CAT_RAW="Raw Photos"
EXT_MAP_CAT_VECTOR="Vector Graphics"
EXT_MAP_CAT_DESIGN="Design Files"
EXT_MAP_CAT_PDF="PDF"
EXT_MAP_CAT_DOCUMENTS="Text Documents"
EXT_MAP_CAT_SPREADSHEETS="Spreadsheets"
EXT_MAP_CAT_PRESENTATIONS="Presentations"
EXT_MAP_CAT_EBOOKS="eBooks"
EXT_MAP_CAT_ARCHIVES="Archives"
EXT_MAP_CAT_DISKIMAGES="Disk Images / VM images"
EXT_MAP_CAT_INSTALLERS="Installers"
EXT_MAP_CAT_EXECUTABLES="Executables"
EXT_MAP_CAT_SCRIPTS="Scripts"
EXT_MAP_CAT_SOURCECODE="Source Code"
EXT_MAP_CAT_WEB="Web"
EXT_MAP_CAT_CONFIG="Config"
EXT_MAP_CAT_DATA="Data"
EXT_MAP_CAT_AUDIO="Audio"
EXT_MAP_CAT_VIDEO="Video"
EXT_MAP_CAT_SUBTITLES="Subtitles"
EXT_MAP_CAT_FONTS="Fonts"
EXT_MAP_CAT_3D="3D"
EXT_MAP_CAT_CAD="CAD"
EXT_MAP_CAT_GIS="GIS"
EXT_MAP_CAT_TORRENTS="Torrents"
EXT_MAP_CAT_EMAIL="email"
EXT_MAP_CAT_KEYS="Certificats & Keys"
EXT_MAP_CAT_DATABASES="Databases"
EXT_MAP_CAT_LOGS="Logs"
EXT_MAP_CAT_BACKUPS="Backups"


# skip list (for folders)
declare -A SKIP=()

SKIP["Folders"]=1 # creates the key "folders" in the Associative Array "SKIP"
SKIP["Other"]=1

while IFS= read -r varname; # reads a row and saves it in varname; IFS= (empty) prevents splitting on spaces
do
  SKIP["${!varname}"]=1 # takes the contents of varname and gets its value
done < <(compgen -v EXT_MAP_CAT_)


# file extensions
declare -A EXT_MAP=(
  # Images
  [jpg]="$EXT_MAP_CAT_IMAGES"
  [jpeg]="$EXT_MAP_CAT_IMAGES"
  [png]="$EXT_MAP_CAT_IMAGES"
  [gif]="$EXT_MAP_CAT_IMAGES"
  [webp]="$EXT_MAP_CAT_IMAGES"
  [bmp]="$EXT_MAP_CAT_IMAGES"
  [tiff]="$EXT_MAP_CAT_IMAGES"
  [tif]="$EXT_MAP_CAT_IMAGES"
  [heic]="$EXT_MAP_CAT_IMAGES"
  [heif]="$EXT_MAP_CAT_IMAGES"
  [avif]="$EXT_MAP_CAT_IMAGES"
  [ico]="$EXT_MAP_CAT_IMAGES"
  [jxl]="$EXT_MAP_CAT_IMAGES"

  # Raw Photos
  [dng]="$EXT_MAP_CAT_RAW"
  [cr2]="$EXT_MAP_CAT_RAW"
  [cr3]="$EXT_MAP_CAT_RAW"
  [nef]="$EXT_MAP_CAT_RAW"
  [arw]="$EXT_MAP_CAT_RAW"
  [raf]="$EXT_MAP_CAT_RAW"
  [orf]="$EXT_MAP_CAT_RAW"
  [rw2]="$EXT_MAP_CAT_RAW"
  [pef]="$EXT_MAP_CAT_RAW"
  [srw]="$EXT_MAP_CAT_RAW"

  # Vector Graphics
  [svg]="$EXT_MAP_CAT_VECTOR"
  [ai]="$EXT_MAP_CAT_VECTOR"
  [eps]="$EXT_MAP_CAT_VECTOR"
  [ps]="$EXT_MAP_CAT_VECTOR"

  # Design Files
  [psd]="$EXT_MAP_CAT_DESIGN"
  [xcf]="$EXT_MAP_CAT_DESIGN"
  [kra]="$EXT_MAP_CAT_DESIGN"
  [clip]="$EXT_MAP_CAT_DESIGN"

  # PDF
  [pdf]="$EXT_MAP_CAT_PDF"

  # Documents
  [txt]="$EXT_MAP_CAT_DOCUMENTS"
  [md]="$EXT_MAP_CAT_DOCUMENTS"
  [markdown]="$EXT_MAP_CAT_DOCUMENTS"
  [rtf]="$EXT_MAP_CAT_DOCUMENTS"
  [doc]="$EXT_MAP_CAT_DOCUMENTS"
  [docx]="$EXT_MAP_CAT_DOCUMENTS"
  [odt]="$EXT_MAP_CAT_DOCUMENTS"
  [pages]="$EXT_MAP_CAT_DOCUMENTS"
  [tex]="$EXT_MAP_CAT_DOCUMENTS"
  [latex]="$EXT_MAP_CAT_DOCUMENTS"

  # Spreadsheets
  [xls]="$EXT_MAP_CAT_SPREADSHEETS"
  [xlsx]="$EXT_MAP_CAT_SPREADSHEETS"
  [xlsm]="$EXT_MAP_CAT_SPREADSHEETS"
  [ods]="$EXT_MAP_CAT_SPREADSHEETS"
  [csv]="$EXT_MAP_CAT_SPREADSHEETS"
  [tsv]="$EXT_MAP_CAT_SPREADSHEETS"

  # Presentations
  [ppt]="$EXT_MAP_CAT_PRESENTATIONS"
  [pptx]="$EXT_MAP_CAT_PRESENTATIONS"
  [odp]="$EXT_MAP_CAT_PRESENTATIONS"

  # Ebooks
  [epub]="$EXT_MAP_CAT_EBOOKS"
  [mobi]="$EXT_MAP_CAT_EBOOKS"
  [azw]="$EXT_MAP_CAT_EBOOKS"
  [azw3]="$EXT_MAP_CAT_EBOOKS"
  [fb2]="$EXT_MAP_CAT_EBOOKS"
  [djvu]="$EXT_MAP_CAT_EBOOKS"

  # Archives
  [zip]="$EXT_MAP_CAT_ARCHIVES"
  [7z]="$EXT_MAP_CAT_ARCHIVES"
  [rar]="$EXT_MAP_CAT_ARCHIVES"
  [tar]="$EXT_MAP_CAT_ARCHIVES"
  [gz]="$EXT_MAP_CAT_ARCHIVES"
  [bz2]="$EXT_MAP_CAT_ARCHIVES"
  [xz]="$EXT_MAP_CAT_ARCHIVES"
  [zst]="$EXT_MAP_CAT_ARCHIVES"
  [lz]="$EXT_MAP_CAT_ARCHIVES"
  [lz4]="$EXT_MAP_CAT_ARCHIVES"
  [cab]="$EXT_MAP_CAT_ARCHIVES"
  [tgz]="$EXT_MAP_CAT_ARCHIVES"
  [tbz]="$EXT_MAP_CAT_ARCHIVES"
  [tbz2]="$EXT_MAP_CAT_ARCHIVES"
  [txz]="$EXT_MAP_CAT_ARCHIVES"
  [tzst]="$EXT_MAP_CAT_ARCHIVES"

  # Disk Images / VM images
  [iso]="$EXT_MAP_CAT_DISKIMAGES"
  [img]="$EXT_MAP_CAT_DISKIMAGES"
  [vhd]="$EXT_MAP_CAT_DISKIMAGES"
  [vhdx]="$EXT_MAP_CAT_DISKIMAGES"
  [vdi]="$EXT_MAP_CAT_DISKIMAGES"
  [qcow]="$EXT_MAP_CAT_DISKIMAGES"
  [qcow2]="$EXT_MAP_CAT_DISKIMAGES"
  [ova]="$EXT_MAP_CAT_DISKIMAGES"
  [ovf]="$EXT_MAP_CAT_DISKIMAGES"

  # Installers
  [exe]="$EXT_MAP_CAT_INSTALLERS"
  [msi]="$EXT_MAP_CAT_INSTALLERS"
  [msix]="$EXT_MAP_CAT_INSTALLERS"
  [appx]="$EXT_MAP_CAT_INSTALLERS"
  [appxbundle]="$EXT_MAP_CAT_INSTALLERS"
  [dmg]="$EXT_MAP_CAT_INSTALLERS"
  [pkg]="$EXT_MAP_CAT_INSTALLERS"
  [deb]="$EXT_MAP_CAT_INSTALLERS"
  [rpm]="$EXT_MAP_CAT_INSTALLERS"
  [apk]="$EXT_MAP_CAT_INSTALLERS"
  [appimage]="$EXT_MAP_CAT_INSTALLERS"
  [snap]="$EXT_MAP_CAT_INSTALLERS"
  [flatpakref]="$EXT_MAP_CAT_INSTALLERS"
  [flatpakrepo]="$EXT_MAP_CAT_INSTALLERS"

  # Executables
  [bin]="$EXT_MAP_CAT_EXECUTABLES"
  [run]="$EXT_MAP_CAT_EXECUTABLES"
  [jar]="$EXT_MAP_CAT_EXECUTABLES"
  [war]="$EXT_MAP_CAT_EXECUTABLES"

  # Scripts
  [sh]="$EXT_MAP_CAT_SCRIPTS"
  [bash]="$EXT_MAP_CAT_SCRIPTS"
  [zsh]="$EXT_MAP_CAT_SCRIPTS"
  [fish]="$EXT_MAP_CAT_SCRIPTS"
  [ps1]="$EXT_MAP_CAT_SCRIPTS"
  [bat]="$EXT_MAP_CAT_SCRIPTS"
  [cmd]="$EXT_MAP_CAT_SCRIPTS"
  [py]="$EXT_MAP_CAT_SCRIPTS"
  [rb]="$EXT_MAP_CAT_SCRIPTS"
  [pl]="$EXT_MAP_CAT_SCRIPTS"
  [php]="$EXT_MAP_CAT_SCRIPTS"
  [js]="$EXT_MAP_CAT_SCRIPTS"
  [ts]="$EXT_MAP_CAT_SCRIPTS"
  [lua]="$EXT_MAP_CAT_SCRIPTS"

  # Source Code
  [c]="$EXT_MAP_CAT_SOURCECODE"
  [h]="$EXT_MAP_CAT_SOURCECODE"
  [cpp]="$EXT_MAP_CAT_SOURCECODE"
  [hpp]="$EXT_MAP_CAT_SOURCECODE"
  [cc]="$EXT_MAP_CAT_SOURCECODE"
  [cxx]="$EXT_MAP_CAT_SOURCECODE"
  [cs]="$EXT_MAP_CAT_SOURCECODE"
  [java]="$EXT_MAP_CAT_SOURCECODE"
  [kt]="$EXT_MAP_CAT_SOURCECODE"
  [kts]="$EXT_MAP_CAT_SOURCECODE"
  [swift]="$EXT_MAP_CAT_SOURCECODE"
  [go]="$EXT_MAP_CAT_SOURCECODE"
  [rs]="$EXT_MAP_CAT_SOURCECODE"
  [r]="$EXT_MAP_CAT_SOURCECODE"
  [m]="$EXT_MAP_CAT_SOURCECODE"
  [mm]="$EXT_MAP_CAT_SOURCECODE"
  [scala]="$EXT_MAP_CAT_SOURCECODE"
  [groovy]="$EXT_MAP_CAT_SOURCECODE"

  # Web
  [html]="$EXT_MAP_CAT_WEB"
  [htm]="$EXT_MAP_CAT_WEB"
  [css]="$EXT_MAP_CAT_WEB"
  [scss]="$EXT_MAP_CAT_WEB"
  [less]="$EXT_MAP_CAT_WEB"
  [wasm]="$EXT_MAP_CAT_WEB"

  # Config
  [json]="$EXT_MAP_CAT_CONFIG"
  [yaml]="$EXT_MAP_CAT_CONFIG"
  [yml]="$EXT_MAP_CAT_CONFIG"
  [toml]="$EXT_MAP_CAT_CONFIG"
  [ini]="$EXT_MAP_CAT_CONFIG"
  [cfg]="$EXT_MAP_CAT_CONFIG"
  [conf]="$EXT_MAP_CAT_CONFIG"
  [env]="$EXT_MAP_CAT_CONFIG"
  [properties]="$EXT_MAP_CAT_CONFIG"

  # Data
  [xml]="$EXT_MAP_CAT_DATA"
  [jsonl]="$EXT_MAP_CAT_DATA"
  [ndjson]="$EXT_MAP_CAT_DATA"
  [parquet]="$EXT_MAP_CAT_DATA"
  [avro]="$EXT_MAP_CAT_DATA"
  [orc]="$EXT_MAP_CAT_DATA"
  [feather]="$EXT_MAP_CAT_DATA"
  [pkl]="$EXT_MAP_CAT_DATA"
  [pickle]="$EXT_MAP_CAT_DATA"
  [npy]="$EXT_MAP_CAT_DATA"
  [npz]="$EXT_MAP_CAT_DATA"
  [mat]="$EXT_MAP_CAT_DATA"
  [h5]="$EXT_MAP_CAT_DATA"
  [hdf5]="$EXT_MAP_CAT_DATA"

  # Audio
  [mp3]="$EXT_MAP_CAT_AUDIO"
  [m4a]="$EXT_MAP_CAT_AUDIO"
  [aac]="$EXT_MAP_CAT_AUDIO"
  [flac]="$EXT_MAP_CAT_AUDIO"
  [wav]="$EXT_MAP_CAT_AUDIO"
  [ogg]="$EXT_MAP_CAT_AUDIO"
  [opus]="$EXT_MAP_CAT_AUDIO"
  [wma]="$EXT_MAP_CAT_AUDIO"
  [aiff]="$EXT_MAP_CAT_AUDIO"
  [aif]="$EXT_MAP_CAT_AUDIO"
  [mid]="$EXT_MAP_CAT_AUDIO"
  [midi]="$EXT_MAP_CAT_AUDIO"

  # Video
  [mp4]="$EXT_MAP_CAT_VIDEO"
  [mkv]="$EXT_MAP_CAT_VIDEO"
  [mov]="$EXT_MAP_CAT_VIDEO"
  [avi]="$EXT_MAP_CAT_VIDEO"
  [webm]="$EXT_MAP_CAT_VIDEO"
  [m4v]="$EXT_MAP_CAT_VIDEO"
  [mpg]="$EXT_MAP_CAT_VIDEO"
  [mpeg]="$EXT_MAP_CAT_VIDEO"
  [ts]="$EXT_MAP_CAT_VIDEO"
  [m2ts]="$EXT_MAP_CAT_VIDEO"
  [flv]="$EXT_MAP_CAT_VIDEO"
  [wmv]="$EXT_MAP_CAT_VIDEO"
  [3gp]="$EXT_MAP_CAT_VIDEO"

  # Subtitles
  [srt]="$EXT_MAP_CAT_SUBTITLES"
  [vtt]="$EXT_MAP_CAT_SUBTITLES"
  [ass]="$EXT_MAP_CAT_SUBTITLES"
  [ssa]="$EXT_MAP_CAT_SUBTITLES"
  [sub]="$EXT_MAP_CAT_SUBTITLES"
  [idx]="$EXT_MAP_CAT_SUBTITLES"

  # Fonts
  [ttf]="$EXT_MAP_CAT_FONTS"
  [otf]="$EXT_MAP_CAT_FONTS"
  [woff]="$EXT_MAP_CAT_FONTS"
  [woff2]="$EXT_MAP_CAT_FONTS"
  [eot]="$EXT_MAP_CAT_FONTS"

  # 3D
  [stl]="$EXT_MAP_CAT_3D"
  [obj]="$EXT_MAP_CAT_3D"
  [fbx]="$EXT_MAP_CAT_3D"
  [glb]="$EXT_MAP_CAT_3D"
  [gltf]="$EXT_MAP_CAT_3D"
  [blend]="$EXT_MAP_CAT_3D"
  [dae]="$EXT_MAP_CAT_3D"
  [3ds]="$EXT_MAP_CAT_3D"
  [step]="$EXT_MAP_CAT_3D"
  [stp]="$EXT_MAP_CAT_3D"
  [igs]="$EXT_MAP_CAT_3D"
  [iges]="$EXT_MAP_CAT_3D"

  # CAD
  [dwg]="$EXT_MAP_CAT_CAD"
  [dxf]="$EXT_MAP_CAT_CAD"

  # GIS
  [geojson]="$EXT_MAP_CAT_GIS"
  [kml]="$EXT_MAP_CAT_GIS"
  [kmz]="$EXT_MAP_CAT_GIS"
  [gpx]="$EXT_MAP_CAT_GIS"
  [shp]="$EXT_MAP_CAT_GIS"
  [shx]="$EXT_MAP_CAT_GIS"
  [dbf]="$EXT_MAP_CAT_GIS"

  # Torrents
  [torrent]="$EXT_MAP_CAT_TORRENTS"

  # Email
  [eml]="$EXT_MAP_CAT_EMAIL"
  [msg]="$EXT_MAP_CAT_EMAIL"
  [mbox]="$EXT_MAP_CAT_EMAIL"
  [pst]="$EXT_MAP_CAT_EMAIL"

  # Certificates & Keys
  [pem]="$EXT_MAP_CAT_KEYS"
  [crt]="$EXT_MAP_CAT_KEYS"
  [cer]="$EXT_MAP_CAT_KEYS"
  [der]="$EXT_MAP_CAT_KEYS"
  [pfx]="$EXT_MAP_CAT_KEYS"
  [p12]="$EXT_MAP_CAT_KEYS"
  [key]="$EXT_MAP_CAT_KEYS"
  [asc]="$EXT_MAP_CAT_KEYS"
  [sig]="$EXT_MAP_CAT_KEYS"

  # Databases
  [sqlite]="$EXT_MAP_CAT_DATABASES"
  [db]="$EXT_MAP_CAT_DATABASES"
  [mdb]="$EXT_MAP_CAT_DATABASES"
  [accdb]="$EXT_MAP_CAT_DATABASES"
  [sql]="$EXT_MAP_CAT_DATABASES"

  # Logs
  [log]="$EXT_MAP_CAT_LOGS"

  # Backups
  [bak]="$EXT_MAP_CAT_BACKUPS"
  [backup]="$EXT_MAP_CAT_BACKUPS"
  [old]="$EXT_MAP_CAT_BACKUPS"
)