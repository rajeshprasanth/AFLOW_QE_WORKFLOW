#!/bin/bash
#
#
for pressure in $(seq 0 10 100)
do
for relax_type in "all"
do
cat > Mg3Sb2.pbe.nvdw.vcrelax.$relax_type.$pressure.in << EOF
&CONTROL
                       title = 'Mg3Sb2'
                 calculation = 'vc-relax'
                restart_mode = 'from_scratch'
                      outdir = './Mg3Sb2.pbe.nvdw.vcrelax.$relax_type.$pressure'
                  pseudo_dir = '/usr/share/espresso/pseudo' 
                     tstress = .true.
                     tprnfor = .true.
                   verbosity = 'high'
               etot_conv_thr = 1.0D-6
               forc_conv_thr = 1.0D-5
/

&SYSTEM
                       ibrav = 0
                         nat = 5
                        ntyp = 2
                        nbnd = 16
                     ecutwfc = 50
              !      ecutrho = 600
/

&ELECTRONS
                    conv_thr = 1.0D-8
            diago_cg_maxiter = 5000
            electron_maxstep = 5000
             diagonalization = 'cg'
/

&IONS
                ion_dynamics = 'bfgs'
/

&CELL
	               press = $pressure
                 cell_dofree = '$relax_type'
              press_conv_thr = 0.1
/

ATOMIC_SPECIES
  Sb  121.76000  Sb.pbe-mt_fhi.UPF
  Mg   24.30500  Mg.pbe-mt_fhi.UPF

ATOMIC_POSITIONS {crystal}
Sb   0.333333333333333   0.666666666666667   0.235000000000000 
Sb   0.666666666666667   0.333333333333333   0.765000000000000 
Mg   0.000000000000000   0.000000000000000   0.000000000000000 
Mg   0.333333333333333   0.666666666666667   0.630000000000000 
Mg   0.666666666666667   0.333333333333333   0.370000000000000 

CELL_PARAMETERS {angstrom}
   4.60074300000000   0.00000000000000   0.00000000000000
  -2.30037200000000   3.98436000000000   0.00000000000000
   0.00000000000000   0.00000000000000   7.28133000000000
 
K_POINTS {automatic}
8 8 4  0 0 0
EOF
cat > Mg3Sb2.pbe.vdw.vcrelax.$relax_type.$pressure.in << EOF
&CONTROL
                       title = 'Mg3Sb2'
                 calculation = 'vc-relax'
                restart_mode = 'from_scratch'
                      outdir = './Mg3Sb2.pbe.vdw.vcrelax.$relax_type.$pressure'
                  pseudo_dir = '/usr/share/espresso/pseudo' 
                     tstress = .true.
                     tprnfor = .true.
                   verbosity = 'high'
               etot_conv_thr = 1.0D-6
               forc_conv_thr = 1.0D-5
/

&SYSTEM
                       ibrav = 0
                         nat = 5
                        ntyp = 2
                        nbnd = 16
                     ecutwfc = 50
                 !    ecutrho = 600
                   input_dft = 'vdW-DF'
/

&ELECTRONS
                    conv_thr = 1.0D-8
            diago_cg_maxiter = 5000
            electron_maxstep = 5000
             diagonalization = 'cg'
/

&IONS
                ion_dynamics = 'bfgs'
/

&CELL
	               press = $pressure
                 cell_dofree = '$relax_type'
              press_conv_thr = 0.1
/

ATOMIC_SPECIES
  Sb  121.76000  Sb.pbe-mt_fhi.UPF
  Mg   24.30500  Mg.pbe-mt_fhi.UPF

ATOMIC_POSITIONS {crystal}
Sb   0.333333333333333   0.666666666666667   0.235000000000000 
Sb   0.666666666666667   0.333333333333333   0.765000000000000 
Mg   0.000000000000000   0.000000000000000   0.000000000000000 
Mg   0.333333333333333   0.666666666666667   0.630000000000000 
Mg   0.666666666666667   0.333333333333333   0.370000000000000 

CELL_PARAMETERS {angstrom}
   4.60074300000000   0.00000000000000   0.00000000000000
  -2.30037200000000   3.98436000000000   0.00000000000000
   0.00000000000000   0.00000000000000   7.28133000000000
  
K_POINTS {automatic}
8 8 4  0 0 0
EOF

/usr/lib64/openmpi3/bin/mpirun -np 4 /usr/share/espresso/bin/pw.x -nk 1 -nd 1 -nb 1 -nt 1 < Mg3Sb2.pbe.nvdw.vcrelax.$relax_type.$pressure.in > Mg3Sb2.pbe.nvdw.vcrelax.$relax_type.$pressure.out 2> Mg3Sb2.pbe.nvdw.vcrelax.$relax_type.$pressure.err

/usr/lib64/openmpi3/bin/mpirun -np 4 /usr/share/espresso/bin/pw.x -nk 1 -nd 1 -nb 1 -nt 1 < Mg3Sb2.pbe.vdw.vcrelax.$relax_type.$pressure.in > Mg3Sb2.pbe.vdw.vcrelax.$relax_type.$pressure.out 2> Mg3Sb2.pbe.vdw.vcrelax.$relax_type.$pressure.err


done
done





for pressure in $(seq 0 10 100)
do
for relax_type in "all"
do
cat > Mg3Sb2.pw.nvdw.vcrelax.$relax_type.$pressure.in << EOF
&CONTROL
                       title = 'Mg3Sb2'
                 calculation = 'vc-relax'
                restart_mode = 'from_scratch'
                      outdir = './Mg3Sb2.pw.nvdw.vcrelax.$relax_type.$pressure'
                  pseudo_dir = '/usr/share/espresso/pseudo' 
                     tstress = .true.
                     tprnfor = .true.
                   verbosity = 'high'
               etot_conv_thr = 1.0D-6
               forc_conv_thr = 1.0D-5
/

&SYSTEM
                       ibrav = 0
                         nat = 5
                        ntyp = 2
                        nbnd = 16
                     ecutwfc = 50
              !      ecutrho = 600
/

&ELECTRONS
                    conv_thr = 1.0D-8
            diago_cg_maxiter = 5000
            electron_maxstep = 5000
             diagonalization = 'cg'
/

&IONS
                ion_dynamics = 'bfgs'
/

&CELL
	               press = $pressure
                 cell_dofree = '$relax_type'
              press_conv_thr = 0.1
/

ATOMIC_SPECIES
  Sb  121.76000  Sb.pw-mt_fhi.UPF
  Mg   24.30500  Mg.pw-mt_fhi.UPF

ATOMIC_POSITIONS {crystal}
Sb   0.333333333333333   0.666666666666667   0.235000000000000 
Sb   0.666666666666667   0.333333333333333   0.765000000000000 
Mg   0.000000000000000   0.000000000000000   0.000000000000000 
Mg   0.333333333333333   0.666666666666667   0.630000000000000 
Mg   0.666666666666667   0.333333333333333   0.370000000000000 

CELL_PARAMETERS {angstrom}
   4.60074300000000   0.00000000000000   0.00000000000000
  -2.30037200000000   3.98436000000000   0.00000000000000
   0.00000000000000   0.00000000000000   7.28133000000000
 
K_POINTS {automatic}
8 8 4  0 0 0
EOF
cat > Mg3Sb2.pw.vdw.vcrelax.$relax_type.$pressure.in << EOF
&CONTROL
                       title = 'Mg3Sb2'
                 calculation = 'vc-relax'
                restart_mode = 'from_scratch'
                      outdir = './Mg3Sb2.pw.vdw.vcrelax.$relax_type.$pressure'
                  pseudo_dir = '/usr/share/espresso/pseudo' 
                     tstress = .true.
                     tprnfor = .true.
                   verbosity = 'high'
               etot_conv_thr = 1.0D-6
               forc_conv_thr = 1.0D-5
/

&SYSTEM
                       ibrav = 0
                         nat = 5
                        ntyp = 2
                        nbnd = 16
                     ecutwfc = 50
                 !    ecutrho = 600
                   input_dft = 'vdW-DF'
/

&ELECTRONS
                    conv_thr = 1.0D-8
            diago_cg_maxiter = 5000
            electron_maxstep = 5000
             diagonalization = 'cg'
/

&IONS
                ion_dynamics = 'bfgs'
/

&CELL
	               press = $pressure
                 cell_dofree = '$relax_type'
              press_conv_thr = 0.1
/

ATOMIC_SPECIES
  Sb  121.76000  Sb.pw-mt_fhi.UPF
  Mg   24.30500  Mg.pw-mt_fhi.UPF

ATOMIC_POSITIONS {crystal}
Sb   0.333333333333333   0.666666666666667   0.235000000000000 
Sb   0.666666666666667   0.333333333333333   0.765000000000000 
Mg   0.000000000000000   0.000000000000000   0.000000000000000 
Mg   0.333333333333333   0.666666666666667   0.630000000000000 
Mg   0.666666666666667   0.333333333333333   0.370000000000000 

CELL_PARAMETERS {angstrom}
   4.60074300000000   0.00000000000000   0.00000000000000
  -2.30037200000000   3.98436000000000   0.00000000000000
   0.00000000000000   0.00000000000000   7.28133000000000
  
K_POINTS {automatic}
8 8 4  0 0 0
EOF

/usr/lib64/openmpi3/bin/mpirun -np 4 /usr/share/espresso/bin/pw.x -nk 1 -nd 1 -nb 1 -nt 1 < Mg3Sb2.pw.nvdw.vcrelax.$relax_type.$pressure.in > Mg3Sb2.pw.nvdw.vcrelax.$relax_type.$pressure.out 2> Mg3Sb2.pw.nvdw.vcrelax.$relax_type.$pressure.err

/usr/lib64/openmpi3/bin/mpirun -np 4 /usr/share/espresso/bin/pw.x -nk 1 -nd 1 -nb 1 -nt 1 < Mg3Sb2.pw.vdw.vcrelax.$relax_type.$pressure.in > Mg3Sb2.pw.vdw.vcrelax.$relax_type.$pressure.out 2> Mg3Sb2.pw.vdw.vcrelax.$relax_type.$pressure.err


done
done
