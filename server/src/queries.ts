import { User, Profile } from "./models";

import { Prisma, PrismaClient } from "@prisma/client";
import { Request, Response } from "express";
import bcrypt from "bcrypt";

const prisma = new PrismaClient();

const getUsers = async (req: Request, res: Response) => {
  const users = await prisma.user.findMany({
    orderBy: { id: "asc" },
  });
  res.status(200).json(users);
};

const loginUser = async (req: Request, res: Response) => {
  const { email, password } = req.body as User;
  const user = await prisma.user.findUnique({
    where: {
      email,
    },
  });

  if (user) {
    const hashedPassword = user.password;
    const result = await bcrypt.compare(password, hashedPassword);
    result
      ? res.status(200).json(user)
      : res.status(404).send("Password Incorrect");
  } else {
    res.status(404).send("Email does not exist");
  }
};

const registerUser = async (req: Request, res: Response) => {
  const { firstName, lastName, email, password } = req.body as User;

  const emailExists =
    (await prisma.user.findUnique({
      where: {
        email,
      },
    })) != null;

  if (emailExists) {
    res.status(404).send("Email Already exists.");
  } else {
    const salt = await bcrypt.genSalt();
    const hash = await bcrypt.hash(password, salt);

    const createdUser = await prisma.user.create({
      data: {
        firstName,
        lastName,
        email,
        dateCreated: undefined,
        password: hash,
      },
    });
    res.status(200).json(createdUser);
  }
};

const db = {
  getUsers,
  loginUser,
  registerUser,
};

export default db;
