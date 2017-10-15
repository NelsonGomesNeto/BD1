#!/bin/bash
for ((i = 1; i <= 20; i ++))
do
  echo "$i"
  echo "Questão $i" >> ./Respostas.sql
  cat ./$i.sql >> ./Respostas.sql
  echo "
  " >> ./Respostas.sql
done
