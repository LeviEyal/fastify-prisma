/*
  Warnings:

  - You are about to drop the column `packages` on the `Version` table. All the data in the column will be lost.
  - You are about to drop the column `versions` on the `Version` table. All the data in the column will be lost.
  - Added the required column `package` to the `Version` table without a default value. This is not possible if the table is not empty.
  - Added the required column `version` to the `Version` table without a default value. This is not possible if the table is not empty.

*/

ALTER TABLE `Version` RENAME COLUMN `packages` TO `package`;
ALTER TABLE `Version` RENAME COLUMN `versions` TO `version`;