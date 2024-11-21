# Scripts useful on BioHPC/ECCO

## Usage

These scripts do a variety to convenience things on the ECCO BioHPC systems. None are required. You can also browse the scripts to see how you could use them individually.

For more details on the SLURM cluster on ECCO BioHPC, see <https://labordynamicsinstitute.github.io/ecco-notes/docs/biohpc/slurm.html>.

### `srun-xstata*`

These scripts allow for running one-line commands to start an interactive graphical Stata session. 

```bash
srun-xstata
```

will run a single-CPU using Stata GUI (preferred). If you absolutely need more cores, use `srun-xstata-mp`.
 
## Installing

There is no single way. One process may be:

```bash
[[ -d $HOME/bin ]] || mkdir $HOME/bin
cd $HOME/bin
```

then `git clone` this repository, which should created `$HOME/bin/biohpc-scripts`. Now add it to your path, f.i. in `$HOME/.bashrc`:

```bash
echo '# added for biohpc-scripts
export PATH=$HOME/bin/biohpc-scripts:$PATH' >> $HOME/.bashrc
```

Adjust as necessary, and don't run this twice.

You can then test whether the install took by logging into a new login shell and typing

```bash
which xstata.sh
```


