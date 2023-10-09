#!/bin/bash

quotes= (
  "Mornings are for coffee and contemplation."
  "I stand upon my desk to remind myself that we must constantly look at things in a different way."
  "The human race is filled with passion!"
  "No matter what anybody tells you, words and ideas can change the world."
  "Carpe Diem, seize the day boys, make your lives extraordinary."
  "Why are you keeping this curiosity door locked?"
  "You should not like things because people tell you you are supposed to."
)

day=$(date +%w)
index=$((day % 7))

readme=$(cat README.md)
new_readme=$(echo "$readme" | awk -v new_quote="${quotes[$index]}" '/quote:/ {$0="quote: "new_quote} 1')

echo "$new_readme" > README.md

git add README.md
git commit -m "Update quote in readme"
git push origin main