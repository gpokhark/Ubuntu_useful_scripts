# Conda Tips 
Verify that the cv-nd environment was created in your environments: 

`conda info --envs `

Cleanup downloaded libraries (remove tarballs, zip files, etc): 

`conda clean -tp `

# To use local GPU in conda 
For additional information 

[Pytorch Get Started](https://pytorch.org/get-started/locally/)

[Udacity CV-ND](https://github.com/udacity/CVND_Exercises)

[Speed Up your Algorithms Part 1 — PyTorch](https://towardsdatascience.com/speed-up-your-algorithms-part-1-pytorch-56d8a4ae7051)

[TORCH.CUDA](https://pytorch.org/docs/stable/cuda.html) 

[How to check if pytorch is using the GPU?](https://stackoverflow.com/questions/48152674/how-to-check-if-pytorch-is-using-the-gpu/48152675)


Tensor datatype from cuda to cpu 

[Differences between `torch.Tensor` and `torch.cuda.Tensor`](https://stackoverflow.com/questions/53628940/differences-between-torch-tensor-and-torch-cuda-tensor)

To see GPU udsage in terminal use ->  

`watch -n 2 nvidia-smi `

Open terminal  
```
Conda create –n cv-nd-gpu python=3.6 
Conda activate cv-nd-gpu 
conda install pytorch torchvision cudatoolkit=9.0 -c pytorch  
Git clone https://github.com/udacity/CVND_Exercises.git 
Cd CVND_Exercises 
pip install -r requirements.txt 
Jupyter-notebook
```

Inside jupypter notebook 
```
import torch 
print(torch.cuda.is_available()) 
print(torch.cuda.current_device()) 
print(torch.cuda.device(0)) 
print(torch.cuda.device_count()) 
print(torch.cuda.get_device_name(0)) 
```
Output should look like this:

![Image](./media/Conda.png)

# Google Colab
Read how to mount google drive and use it to hold the dataset for training using Google GPU 

[Downloading Datasets into Google Drive via Google Colab](https://towardsdatascience.com/downloading-datasets-into-google-drive-via-google-colab-bcb1b30b0166)

In google colab cell use this to mount google drive 
```
from google.colab import drive 
drive.mount('/content/gdrive') 
```