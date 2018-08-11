# .bashrc

# Auto-screen invocation. see: http://taint.org/wk/RemoteLoginAutoScreen
# if we're coming from a remote SSH connection, in an interactive session
# then automatically put us into a screen(1) session.   Only try once
# -- if $STARTED_SCREEN is set, don't try it again, to avoid looping
# if screen fails for some reason.
if [ "$PS1" != "" -a "${STARTED_SCREEN:-x}" = x -a "${SSH_TTY:-x}" != x ] 
then
  STARTED_SCREEN=1 ; export STARTED_SCREEN
  screen -xRR -S main || echo "Screen failed! continuing with normal bash startup"
fi
# [end of auto-screen snippet]

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias ls="ls --color=auto --group-directories-first"
alias grep="grep --color=always"
alias py34="source activate pyaeroopt34"
alias xargs="xargs "
alias matlab="matlab -nodisplay"
job(){
    qsub -IX -l nodes=$1:ppn=16 -q sandybridge
}

# Make the transition onto a compute node smooth
cd $PBS_O_WORKDIR
module load intel/intel-13 openmpi/openmpi161_intel13

export PYTHONPATH=$PYTHONPATH:/home/aspenser
export SOWER=sower
export PARTMESH=partnmesh
export XP2EXO=xp2exo
export MATCHER=matcher
export AEROF=aerof.opt
export AEROS=aeros
export SDESIGN=sdesign.Linux.opt
export BLENDER=blender\ -noaudio

# Add my own binaries to the PATH
export PATH="/home/aspenser/bin:$PATH"
export PATH="/home/aspenser/local/bin:$PATH"

# added by Anaconda3 4.4.0 installer
export PATH="/home/aspenser/software/anaconda3/bin:$PATH"

# Add my own libraries to the library path
export LD_LIBRARY_PATH=/home/aspenser/local/lib/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/share/apps/MATLAB/MATLAB-R2016b/sys/os/glnxa64:$LD_LIBRARY_PATH

# add a "config" alias to manipulate the dotfile repo that lives in ~/.cfg
alias config='git --git-dir=/home/aspenser/.cfg/ --work-tree=/home/aspenser'
