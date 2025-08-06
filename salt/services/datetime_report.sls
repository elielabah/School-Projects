show_datetime_and_locale:
  cmd.run:
    - name: |
        echo "Date et Heure : $(date '+%Y-%m-%d %H:%M:%S %Z %z')"
        echo "Locale système : $LANG"
