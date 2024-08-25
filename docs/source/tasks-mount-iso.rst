Mount ISO *(mount-iso)*
-----------------------

Mount ISO.

Example
^^^^^^^

Enable the mounting of ISO images (2) and create the list of mount points (3). For example,

.. code-block:: yaml
   :emphasize-lines: 2,3
   :linenos:

    shell> cat host_vars/build.example.com/fp-mount-iso.yml 
    fp_mount_iso: true
    fp_mount_iso_entries:
      - iso: /export/img/FreeBSD/12.2/FreeBSD-12.2-RELEASE-amd64-disc1.iso
        mount: /export/distro/FreeBSD-12.1-RELEASE-amd64-disc1.iso

Dry-run the tasks, display the variables, and display the changes ::

   shell> ansible-playbook playbook.yml -t fp_mount_iso -e fp_mount_iso_debug=true -CD

If all seems to be right create the vnode and mount the ISO image ::

   shell> ansible-playbook playbook.yml -t fp_mount_iso

Log to the remote host, list memory disks (2) and related mount points (5)

.. code-block:: sh
   :emphasize-lines: 2,5
   :linenos:

    shell> mdconfig -l -v
    md0 vnode 868M /export/images/FreeBSD/12.2/FreeBSD-12.2-RELEASE-amd64-disc1.iso

    shell> df | grep iso
    /dev/md0 888380 888380 0 100% /export/distro/FreeBSD-12.2-RELEASE-amd64-disc1.iso

.. seealso::

   * Annotated Source code :ref:`as_mount-iso.yml`
