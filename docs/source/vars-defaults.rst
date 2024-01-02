Default variables
-----------------

[`defaults/main <https://github.com/vbotka/ansible-freebsd-postinstall/tree/master/defaults/main/>`_]

The common variables are stored in the files in the directory
``defaults/main``. These variables can be customized in the file
``vars/main.yml``. The file ``vars/main.yml`` will be preserved by the
update of the role.

.. warning::

   * Don't make any changes to the files in the directory
     defaults/main. The changes might be overwritten when the role is
     updated. Customize the default values in the file vars/main.yml.

.. seealso::

   * The examples of the customization in the directory
     ``vars/samples``
