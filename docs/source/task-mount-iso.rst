mount-iso
=========

Mount images.

**Example**

Enable the mounting of images (3) and create the list of mount points (4). For example

.. code-block:: sh
   :emphasize-lines: 3,4
   :linenos:

   shell> cat host_vars/build.example.com/fp-mount-iso.yml 
   ---
   fp_mount_iso: true
   fp_mount_iso_entries:
     - iso: /export/img/FreeBSD-12.2-RELEASE-arm-armv7-CUBOX-HUMMINGBOARD.img
       mount: /usr/local/poudriere/jails/12arm7
       fstype: ufs
       partition: s2a
   ...

Dry-run the tasks, display the variables, and display the changes ::

   shell> ansible-playbook playbook.yml -t fp_mount_iso -e fp_mount_iso_debug=true -CD

If all seems to be right mount the images ::

   shell> ansible-playbook playbook.yml -t fp_mount_iso

Log to the remote host, list memory disks (2) and related mount points (5) ::

   shell> mdconfig -l -v
   md0 vnode 3072M /export/img/FreeBSD-12.2-RELEASE-arm-armv7-CUBOX-HUMMINGBOARD.img

   shell> df | grep arm
   /dev/md0s2a 5971064 4056912 1436472 74% /zroot/poudriere/jails/12arm7


.. seealso::

   * Annotated Source code :ref:`as_mount-iso.yml`
