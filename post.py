from ast import literal_eval
from json import load
import discord
from discord.ext import commands
from sys import argv

intents = discord.Intents.default()
intents.members = True
intents.message_content = True

bot = commands.Bot(
    command_prefix=commands.when_mentioned_or("$"),
    description="",
    intents=intents,
)

# payload = load(open(r"D:\GitHub\CTT\webhooks\a.json"))
payload = """
{
  "content": null,
  "embeds": [
    {
      "title": "idk what is this about",
      "description": "balls",
      "color": null
    }
  ],
  "attachments": []
}
"""


@bot.event
async def on_ready():
    guild = bot.get_guild(1070184725580349440)
    forum = guild.get_channel(1071432837229719613)

    embed = discord.Embed.from_dict(payload)

    await forum.create_thread("OBS - Advanced", snowflake=payload)
    # for payload in payloads:
    #     # print(payload)
    #     channel = bot.get_channel(1070841723565129788)
    #     embed = discord.Embed.from_dict(payload)
    #     print(type(embed))
    #     await channel.send(embed=embed)
    # exit(0)

token = load(open('./token.json'))
bot.run(token["Token"])
