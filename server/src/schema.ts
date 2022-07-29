import {
  Delivery,
  Match,
  Message,
  Order,
  Status,
} from "@prisma/client";
import {
  makeSchema,
  mutationType,
  nonNull,
  objectType,
  queryType,
  stringArg,
  subscriptionType,
  intArg,
  arg,
  inputObjectType,
  booleanArg,
  asNexusMethod,
  nullable,
} from "nexus";
import { context, Context } from "./context";

import { DateTimeResolver } from "graphql-scalars";
export const DateTime = asNexusMethod(DateTimeResolver, "date");

const User = objectType({
  name: "User",
  definition(t) {
    t.nonNull.int("id");
    t.nonNull.string("firstName");
    t.nonNull.string("lastName");
    t.nonNull.string("email");
    t.nonNull.boolean("emailVerified");
    t.nonNull.string("password");
    t.string("picture");
    t.nonNull.field("dateCreated", { type: "DateTime" });
    t.nonNull.boolean("delivering");
  },
});

const Place = objectType({
  name: "Place",
  definition(t) {
    t.nonNull.int("id");
    t.nonNull.string("name");
    t.nonNull.string("fullAddress");
    t.nonNull.string("streetAddress");
    t.nonNull.string("state");
    t.nonNull.string("city");
    t.nonNull.int("zipcode");
    t.nonNull.string("googlePlaceId");
    t.nullable.string("websiteUrl");
  },
});

const Resturant = objectType({
  name: "Resturant",
  definition(t) {
    t.nonNull.int("placeId");
    t.field("place", {
      type: "Place",
      resolve: (parent, _args, context: Context) => {
        return context.prisma.resturant
          .findUnique({
            where: { placeId: parent.placeId },
          })
          .place();
      },
    });
  },
});

const DeliveryBuilding = objectType({
  name: "DeliveryBuilding",
  definition(t) {
    t.nonNull.int("placeId");
    t.field("place", {
      type: "Place",
      resolve: (parent, _args, context: Context) => {
        return context.prisma.deliveryBuilding
          .findUnique({
            where: { placeId: parent.placeId || undefined },
          })
          .place();
      },
    });
  },
});

const Delivery = objectType({
  name: "Delivery",
  definition(t) {
    t.nonNull.int("id");
    t.nonNull.string("orderStatus");
    t.nonNull.int("userId"),
      t.field("user", {
        type: "User",
        resolve: (parent, _, context: Context) => {
          return context.prisma.delivery
            .findUnique({
              where: { id: parent.id },
            })
            .user();
        },
      });
    t.nonNull.int("resturantPlaceId"),
      t.field("resturant", {
        type: "Resturant",
        resolve: (parent, _args, context: Context) => {
          return context.prisma.delivery
            .findUnique({
              where: { id: parent.id },
            })
            .resturant();
        },
      });
    t.nonNull.int("deliveryBuildingPlaceId"),
      t.field("deliveryBuilding", {
        type: "DeliveryBuilding",
        resolve: (parent, _args, context: Context) => {
          return context.prisma.delivery
            .findUnique({
              where: { id: parent.id },
            })
            .deliveryBuilding();
        },
      });
  },
});

const Order = objectType({
  name: "Order",
  definition(t) {
    t.nonNull.int("id");
    t.nonNull.string("orderStatus");
    t.nonNull.int("userId"),
      t.field("user", {
        type: "User",
        resolve: (parent, _, context: Context) => {
          return context.prisma.order
            .findUnique({
              where: { id: parent.id },
            })
            .user();
        },
      });
    t.nonNull.int("resturantPlaceId"),
      t.field("resturant", {
        type: "Resturant",
        resolve: (parent, _args, context: Context) => {
          return context.prisma.order
            .findUnique({
              where: { id: parent.id },
            })
            .resturant();
        },
      });
    t.nonNull.int("deliveryBuildingPlaceId"),
      t.field("deliveryBuilding", {
        type: "DeliveryBuilding",
        resolve: (parent, _args, context: Context) => {
          return context.prisma.order
            .findUnique({
              where: { id: parent.id },
            })
            .deliveryBuilding();
        },
      });
  },
});

const Match = objectType({
  name: "Match",
  definition(t) {
    t.nonNull.int("id");
    t.nonNull.int("deliveryId"),
      t.field("delivery", {
        type: "Delivery",
        resolve: (parent, _, context: Context) => {
          return context.prisma.match
            .findUnique({
              where: { id: parent.id },
            })
            .delivery();
        },
      });
    t.nonNull.int("orderId"),
      t.field("order", {
        type: "Order",
        resolve: (parent, _, context: Context) => {
          return context.prisma.match
            .findUnique({
              where: { id: parent.id },
            })
            .order();
        },
      });
    t.nonNull.boolean("completed");
    t.nonNull.boolean("delivererAccepted");
    t.nonNull.boolean("ordererAccepted");
  },
});

const Message = objectType({
  name: "Message",
  definition(t) {
    t.nonNull.int("id");
    t.nonNull.string("text");
    t.nonNull.field("createdAt", { type: "DateTime" });
    t.nonNull.int("senderId");
    t.field("sender", {
      type: "User",
      resolve: (parent, _args, context: Context) => {
        return context.prisma.message
          .findUnique({
            where: { id: parent.id },
          })
          .sender();
      },
    });
    t.nonNull.int("recieverId");
    t.field("reciever", {
      type: "User",
      resolve: (parent, _args, context: Context) => {
        return context.prisma.message
          .findUnique({
            where: { id: parent.id },
          })
          .reciever();
      },
    });
    t.nonNull.int("convoId");
    t.field("convo", {
      type: "Convo",
      resolve: (parent, _args, context: Context) => {
        return context.prisma.message
          .findUnique({
            where: { id: parent.id },
          })
          .convo();
      },
    });
  },
});

const Convo = objectType({
  name: "Convo",
  definition(t) {
    t.nonNull.int("id");
    t.nonNull.int("memberOneId");
    t.field("memberOne", {
      type: "User",
      resolve: (parent, _args, context: Context) => {
        return context.prisma.convo
          .findUnique({
            where: { id: parent.id },
          })
          .memberOne();
      },
    });
    t.nonNull.int("memberTwoId");
    t.field("memberTwo", {
      type: "User",
      resolve: (parent, _args, context: Context) => {
        return context.prisma.convo
          .findUnique({
            where: { id: parent.id },
          })
          .memberTwo();
      },
    });
    t.nonNull.list.field("messages", {
      type: "Message",
      resolve: (parent, _args, context: Context) => {
        return context.prisma.convo
          .findFirst({
            where: {
              OR: [
                {
                  memberOneId: parent.memberOneId,
                  memberTwoId: parent.memberTwoId,
                },
                {
                  memberTwoId: parent.memberOneId,
                  memberOneId: parent.memberTwoId,
                },
              ],
            },
          })
          .messages();
      },
    });
  },
});

export const Query = queryType({
  definition(t) {
    t.nonNull.list.nonNull.field("allUsers", {
      type: "User",
      resolve: (_parent, _args, context: Context) => {
        return context.prisma.user.findMany();
      },
    });

    t.nonNull.list.field("allDeliveries", {
      type: "Delivery",
      resolve: (_parent, _args, context: Context) => {
        return context.prisma.delivery.findMany({
          where: {
            orderStatus: Status.placed,
          },
          orderBy: {
            dateCreated: "desc",
          },
        });
      },
    });

    t.field("getUserDelivery", {
      type: "Delivery",
      args: {
        userId: nonNull(intArg()),
      },
      resolve: (_parent, args, context: Context) => {
        return context.prisma.delivery.findFirst({
          where: {
            userId: args.userId,
            orderStatus: Status.placed,
          },
        });
      },
    });

    t.field("getUserOrder", {
      type: "Order",
      args: {
        userId: nonNull(intArg()),
      },
      resolve: (_parent, args, context: Context) => {
        return context.prisma.order.findFirst({
          where: {
            userId: args.userId,
            orderStatus: Status.placed,
          },
        });
      },
    });

    t.nonNull.list.field("getConversation", {
      type: "Message",
      args: {
        senderId: nonNull(intArg()),
        recieverId: nonNull(intArg()),
      },
      resolve: (_parent, args, context: Context) => {
        return context.prisma.message.findMany({
          where: {
            OR: [
              {
                senderId: args.senderId,
                recieverId: args.recieverId,
              },
              {
                senderId: args.recieverId,
                recieverId: args.senderId,
              },
            ],
          },
          orderBy: {
            createdAt: "asc",
          },
        });
      },
    });

    t.nonNull.list.field("getUserConversations", {
      type: "Convo",
      args: {
        currentUserId: nonNull(intArg()),
      },
      resolve: (_parent, args, context: Context) => {
        return context.prisma.convo.findMany({
          where: {
            OR: [
              { memberOneId: args.currentUserId },
              { memberTwoId: args.currentUserId },
            ],
          },
        });
      },
    });

    // all restaurants that currently have deliverers
    t.nonNull.list.field("getAllActiveRestaurants", {
      type: "Resturant",
      resolve: (_parent, _args, context: Context) => {
        return context.prisma.resturant.findMany({
          where: {
            deliveries: {
              some: { orderStatus: { equals: Status.placed } },
            },
          },
        });
      },
    });

    t.nonNull.list.field("getActiveDeliveries", {
      type: "Delivery",
      args: {
        restaurantPlaceId: nonNull(intArg()),
      },
      resolve: (_parent, args, context: Context) => {
        return context.prisma.delivery.findMany({
          where: {
            orderStatus: Status.placed,
            resturantPlaceId: args.restaurantPlaceId,
          },
        });
      },
    });
  },
});

export const Mutation = mutationType({
  definition(t) {
    t.field("login", {
      type: "User",
      args: {
        email: nonNull(stringArg()),
        password: nonNull(stringArg()),
      },
      resolve: async (_parent, args, context: Context) => {
        return await context.db.loginUser(args.email, args.password);
      },
    });

    t.field("register", {
      type: "User",
      args: {
        firstName: nonNull(stringArg()),
        lastName: nonNull(stringArg()),
        email: nonNull(stringArg()),
        password: nonNull(stringArg()),
      },
      resolve: async (_parent, args, context: Context) => {
        return await context.db.registerUser(
          args.firstName,
          args.lastName,
          args.email,
          args.password
        );
      },
    });

    t.field("upsertDelivery", {
      type: "Delivery",
      args: {
        userId: nonNull(intArg()),
        orderStatus: nonNull(stringArg()),
        resturantPlaceId: nonNull(intArg()),
        deliveryBuildingPlaceId: nonNull(intArg()),
      },
      resolve: async (_parent, args) => {
        const newDelivery = await context.db.upsertDelivery(
          args.userId,
          args.orderStatus,
          args.resturantPlaceId,
          args.deliveryBuildingPlaceId
        );

        // Check for match, if found: create and publish the match
        const matchingOrder = await context.db.checkForMatch(
          newDelivery,
          "Delivery"
        );

        if (matchingOrder) {
          const createdMatch = await context.db.createMatch(
            matchingOrder,
            newDelivery
          );
          context.pubsub.publish("newMatch", createdMatch);
        }

        return newDelivery;
      },
    });

    t.field("upsertOrder", {
      type: "Order",
      args: {
        userId: nonNull(intArg()),
        orderStatus: nonNull(stringArg()),
        resturantPlaceId: nonNull(intArg()),
        deliveryBuildingPlaceId: nonNull(intArg()),
      },
      resolve: async (_parent, args) => {
        const newOrder = await context.db.upsertOrder(
          args.userId,
          args.orderStatus,
          args.resturantPlaceId,
          args.deliveryBuildingPlaceId
        );

        // Check for match, if found: create and publish the match
        const matchingDelivery = await context.db.checkForMatch(
          newOrder,
          "Order"
        );

        if (matchingDelivery) {
          const createdMatch = await context.db.createMatch(
            newOrder,
            matchingDelivery
          );
          context.pubsub.publish("newMatch", createdMatch);
        }

        return newOrder;
      },
    });

    t.field("cancelDelivery", {
      type: "Delivery",
      args: { deliveryId: nonNull(intArg()) },
      resolve: async (_parent, args) => {
        const canceledDelivery = await context.prisma.delivery.update(
          {
            where: { id: args.deliveryId },
            data: { orderStatus: "cancelled" },
          }
        );
        return canceledDelivery;
      },
    });

    t.field("cancelOrder", {
      type: "Order",
      args: { orderId: nonNull(intArg()) },
      resolve: async (_parent, args) => {
        const cancelledOrder = await context.prisma.order.update({
          where: { id: args.orderId },
          data: {
            orderStatus: "cancelled",
            matches: { deleteMany: {} },
          },
        });

        context.pubsub.publish("cancelledOrder", cancelledOrder);
        return cancelledOrder;
      },
    });

    t.field("createPlace", {
      type: "Place",
      args: {
        name: nonNull(stringArg()),
        fullAddress: nonNull(stringArg()),
        streetAddress: nonNull(stringArg()),
        state: nonNull(stringArg()),
        city: nonNull(stringArg()),
        zipcode: nonNull(intArg()),
        googlePlaceId: nonNull(stringArg()),
        websiteUrl: nullable(stringArg()),
      },
      resolve: async (
        _parent,
        {
          name,
          fullAddress,
          streetAddress,
          state,
          city,
          zipcode,
          googlePlaceId,
          websiteUrl,
        }
      ) => {
        return await context.db.createPlace({
          name,
          fullAddress,
          streetAddress,
          state,
          city,
          zipcode,
          googlePlaceId,
          websiteUrl,
        });
      },
    });

    t.field("createMessage", {
      type: "Message",
      args: {
        text: nonNull(stringArg()),
        senderId: nonNull(intArg()),
        recieverId: nonNull(intArg()),
      },
      resolve: async (_parent, args) => {
        const newMessage = await context.db.createMessage(
          args.text,
          args.senderId,
          args.recieverId
        );

        //publish the subscription
        context.pubsub.publish("newMessage", newMessage);

        return newMessage;
      },
    });

    // For Deliverers
    t.field("acceptMatch", {
      type: "Match",
      args: {
        matchId: nonNull(intArg()),
      },
      resolve: async (_parent, args) => {
        const acceptedMatch = context.prisma.match.update({
          where: {
            id: args.matchId,
          },
          data: {
            delivererAccepted: true,
            delivery: {
              update: {
                orderStatus: "matched",
              },
            },
            order: {
              update: {
                orderStatus: "matched",
              },
            },
          },
        });

        context.pubsub.publish("matchUpdate", acceptedMatch);
        return acceptedMatch;
      },
    });

    t.field("declineMatch", {
      type: "Match",
      args: {
        matchId: nonNull(intArg()),
      },
      resolve: async (_parent, args) => {
        const declinedMatch = await context.prisma.match.update({
          where: {
            id: args.matchId,
          },
          data: {
            delivererAccepted: false,
          },
        });
        context.pubsub.publish("matchUpdate", declinedMatch);
        return declinedMatch;
      },
    });
  },
});

export const Subscription = subscriptionType({
  definition(t) {
    t.field("newMessage", {
      type: "Message",
      args: {
        recieverId: nonNull(intArg()),
      },
      subscribe(_root, args, context: Context) {
        return context.pubsub.asyncIterator("newMessage");
      },
      resolve(payload: Message) {
        return payload;
      },
    });

    t.field("newMatch", {
      type: "Match",
      subscribe(_root, args, context: Context) {
        return context.pubsub.asyncIterator("newMatch");
      },
      resolve(payload: Match) {
        return payload;
      },
    });

    t.field("matchUpdate", {
      type: "Match",
      subscribe(_root, args, context: Context) {
        return context.pubsub.asyncIterator("matchUpdate");
      },
      resolve(payload: Match) {
        return payload;
      },
    });

    t.field("cancelledOrder", {
      type: "Order",
      subscribe(_root, args, context: Context) {
        return context.pubsub.asyncIterator("cancelledOrder");
      },
      resolve(payload: Order) {
        return payload;
      },
    });
  },
});

export const schema = makeSchema({
  types: [
    Query,
    Mutation,
    User,
    Place,
    DateTime,
    Resturant,
    DeliveryBuilding,
    Delivery,
    Order,
    Subscription,
    Convo,
    Message,
    Match,
  ],
  outputs: {
    schema: __dirname + "/../schema.graphql",
    typegen: __dirname + "/generated/nexus.ts",
  },
  contextType: {
    module: require.resolve("./context"),
    export: "Context",
  },
  sourceTypes: {
    modules: [
      {
        module: "@prisma/client",
        alias: "prisma",
      },
    ],
  },
});
