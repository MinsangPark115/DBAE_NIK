BS=64


DATASET_NAME=$1
PRED=$2
NGPU=4
SIGMA_MAX=80.0
SIGMA_MIN=0.002
SIGMA_DATA=0.5
COV_XY=0


NUM_CH=256
ATTN=32,16,8
SAMPLER=real-uniform
NUM_RES_BLOCKS=2
USE_16FP=FALSE
ATTN_TYPE=flash
COND=concat


if [[ $DATASET_NAME == "ffhq" ]]; then
  DATA_DIR="./data/ffhq" #"xxx/data/ffhq"
  DATASET=ffhq
  IMG_SIZE=128
  NUM_CH=128
  NUM_RES_BLOCKS=2
  LATENT=512
  SAVE_ITER=10000
  STO=True
  END=True
  ENDDATA=0.5
  EXP="ffhq${IMG_SIZE}_${NUM_CH}_${LATENT}d_${STO}"

elif [[ $DATASET_NAME == "celeba" ]]; then
  DATA_DIR="xxx/data/ffhq"
  DATASET=celeba
  IMG_SIZE=64
  NUM_CH=64
  NUM_RES_BLOCKS=2
  LATENT=512
  SAVE_ITER=10000
  STO=False
  END=True
  ENDDATA=0.5
  EXP="celeba${IMG_SIZE}_${NUM_CH}_${LATENT}d_${STO}"

elif [[ $DATASET_NAME == "bedroom" ]]; then
  DATA_DIR="xxx/data/bedroom256.lmdb"
  DATASET=bedroom
  IMG_SIZE=128
  NUM_CH=128
  NUM_RES_BLOCKS=2
  LATENT=512
  SAVE_ITER=10000
  STO=True
  END=True
  ENDDATA=0.5
  EXP="bedroom${IMG_SIZE}_${NUM_CH}_${LATENT}d_${STO}"

elif [[ $DATASET_NAME == "horse" ]]; then
  DATA_DIR="xxx/data/horse.lmdb"
  DATASET=horse
  IMG_SIZE=128
  NUM_CH=128
  NUM_RES_BLOCKS=2
  LATENT=512
  SAVE_ITER=10000
  STO=True
  END=True
  ENDDATA=0.5
  EXP="horse${IMG_SIZE}_${NUM_CH}_${LATENT}d_${STO}"

elif [[ $DATASET_NAME == "celebahq" ]]; then
  DATA_DIR="xxx/data/celebahq"
  DATASET=celebahq
  IMG_SIZE=128
  NUM_CH=128
  NUM_RES_BLOCKS=2
  LATENT=512
  EXP="celeahq${IMG_SIZE}_${NUM_CH}_${LATENT}d_${STO}"
  SAVE_ITER=10000
  STO=True
  END=True
fi
    
if  [[ $PRED == "ve" ]]; then
    EXP+="_ve"
elif  [[ $PRED == "vp" ]]; then
    EXP+="_vp"
    BETA_D=2
    BETA_MIN=0.1
    SIGMA_MAX=1
    SIGMA_MIN=0.0001
elif  [[ $PRED == "ve_simple" ]]; then
    EXP+="_ve_simple"
elif  [[ $PRED == "vp_simple" ]]; then
    EXP+="_vp_simple"
    BETA_D=2
    BETA_MIN=0.1
    SIGMA_MAX=1
    SIGMA_MIN=0.0001
else
    echo "Not supported"
    exit 1
fi
