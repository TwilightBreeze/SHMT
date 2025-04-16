# 可以编写一个脚本来检查所有图像和掩码的尺寸
for img_file in train_data/images/*.jpg; do
    base_name=$(basename "$img_file" .jpg)
    seg_file="train_data/seg2/${base_name}.png"
    
    img_size=$(identify -format "%wx%h" "$img_file")
    seg_size=$(identify -format "%wx%h" "$seg_file")
    
    if [ "$img_size" != "$seg_size" ]; then
        echo "不匹配: $img_file ($img_size) ≠ $seg_file ($seg_size)"
    fi
done