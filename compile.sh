#! /bin/bash
COMPILED_FOLDER="Compiled"
SRC_FOLDER="src"

echo "Copy Light Shell variant."
  sassc -t expanded $SRC_FOLDER/gnome-shell/gnome-shell-light.scss $COMPILED_FOLDER/Minwaita-Light-Shell/gnome-shell/gnome-shell.css
  rm $COMPILED_FOLDER/Minwaita-Light-Shell/gnome-shell/assets/* -R
  cp $SRC_FOLDER/gnome-shell/light-assets/* $COMPILED_FOLDER/Minwaita-Light-Shell/gnome-shell/assets -R
for variant in '' '-Vanilla' '-OSX'; do
  echo "Copy Shell for each variant. (Minwaita${variant})"
  sassc -t expanded $SRC_FOLDER/gnome-shell/gnome-shell.scss $COMPILED_FOLDER/Minwaita${variant}/Minwaita${variant}/gnome-shell/gnome-shell.css
  rm $COMPILED_FOLDER/Minwaita${variant}/Minwaita${variant}/gnome-shell/assets/* -R
  cp $SRC_FOLDER/gnome-shell/dark-assets/* $COMPILED_FOLDER/Minwaita${variant}/Minwaita${variant}/gnome-shell/assets -R
done
for variant in '' '-Vanilla' '-OSX'; do
  sassc -t expanded $SRC_FOLDER/gtk-3.0/gtk${variant,,}.scss $COMPILED_FOLDER/Minwaita${variant}/Minwaita${variant}/gtk-3.0/gtk.css
  sassc -t expanded $SRC_FOLDER/gtk-3.0/gtk${variant,,}-dark.scss $COMPILED_FOLDER/Minwaita${variant}/Minwaita${variant}/gtk-3.0/gtk-dark.css
  sassc -t expanded $SRC_FOLDER/gtk-3.0/gtk${variant,,}-darker.scss $COMPILED_FOLDER/Minwaita${variant}/Minwaita${variant}-Darker/gtk-3.0/gtk.css
  sassc -t expanded $SRC_FOLDER/gtk-3.0/gtk${variant,,}-dark.scss $COMPILED_FOLDER/Minwaita${variant}/Minwaita${variant}-Darker/gtk-3.0/gtk-dark.css
  rm $COMPILED_FOLDER/Minwaita${variant}/Minwaita${variant}/gtk-2.0/assets/*
  rm $COMPILED_FOLDER/Minwaita${variant}/Minwaita${variant}-Darker/gtk-2.0/assets/*
  cp $SRC_FOLDER/gtk-2.0/assets/* $COMPILED_FOLDER/Minwaita${variant}/Minwaita${variant}/gtk-2.0/assets
  cp $SRC_FOLDER/gtk-2.0/assets/* $COMPILED_FOLDER/Minwaita${variant}/Minwaita${variant}-Darker/gtk-2.0/assets
  cp $SRC_FOLDER/gtk-2.0/assets-dark/menubar-item-active.png $COMPILED_FOLDER/Minwaita${variant}/Minwaita${variant}-Darker/gtk-2.0/assets
  cp $SRC_FOLDER/gtk-2.0/gtkrc $COMPILED_FOLDER/Minwaita${variant}/Minwaita${variant}/gtk-2.0/gtkrc
  cp $SRC_FOLDER/gtk-2.0/gtkrc-darker $COMPILED_FOLDER/Minwaita${variant}/Minwaita${variant}-Darker/gtk-2.0/gtkrc
  cp $SRC_FOLDER/gtk-2.0/common-files/* $COMPILED_FOLDER/Minwaita${variant}/Minwaita${variant}/gtk-2.0/
  cp $SRC_FOLDER/gtk-2.0/common-files/* $COMPILED_FOLDER/Minwaita${variant}/Minwaita${variant}-Darker/gtk-2.0/

  for color in '-Dark'; do
    sassc -t expanded $SRC_FOLDER/gtk-3.0/gtk${variant,,}-dark.scss $COMPILED_FOLDER/Minwaita${variant}/Minwaita${variant}${color,}/gtk-3.0/gtk.css
      rm $COMPILED_FOLDER/Minwaita${variant}/Minwaita${variant}${color,}/gtk-2.0/assets/*
      cp $SRC_FOLDER/gtk-2.0/assets-dark/* $COMPILED_FOLDER/Minwaita${variant}/Minwaita${variant}${color,}/gtk-2.0/assets
      cp $SRC_FOLDER/gtk-2.0/gtkrc-dark $COMPILED_FOLDER/Minwaita${variant}/Minwaita${variant}${color,}/gtk-2.0/gtkrc
      cp $SRC_FOLDER/gtk-2.0/common-files/* $COMPILED_FOLDER/Minwaita${variant}/Minwaita${variant}${color,}/gtk-2.0/
      cp $SRC_FOLDER/gtk-2.0/dark-variant-files/* $COMPILED_FOLDER/Minwaita${variant}/Minwaita${variant}${color,}/gtk-2.0/
  done
done
