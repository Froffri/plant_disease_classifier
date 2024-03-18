#!/bin/bash

# Directory contenente le cartelle di immagini
main_dir="./dataset/train"

# Loop attraverso tutte le cartelle contenenti immagini
for img_dir in "$main_dir"/*/; do
    echo "Elaborazione della cartella: $img_dir"

    # Verifica se la cartella esiste
    if [ -d "$img_dir" ]; then
        # Conta il numero di immagini nella cartella
        num_images=$(find "$img_dir" -maxdepth 1 -type f | wc -l)
        
        # Calcola il numero di immagini da eliminare (la metà)
        images_to_delete=$((num_images / 2))
        
        # Elimina le immagini una per una fino a raggiungere il numero desiderato
        for img in "$img_dir"*; do
            rm -f "$img"
            images_to_delete=$((images_to_delete - 1))
            if [ $images_to_delete -eq 0 ]; then
                break
            fi
        done

        echo "Eliminate $((num_images / 2)) immagini dalla cartella $img_dir"
    else
        echo "La cartella $img_dir non esiste o non è una directory."
    fi
done

echo "Eliminazione delle immagini completata."

