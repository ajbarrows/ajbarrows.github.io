export interface MusicEvent {
  date: string; // ISO format: YYYY-MM-DD
  title: string;
  venue: string;
  location: string;
  href?: string;
}

export const events: MusicEvent[] = [
  // Example entries — replace with real events
  // {
  //   date: "2026-05-10",
  //   title: "Vermont Symphony Orchestra",
  //   venue: "Flynn Center",
  //   location: "Burlington, VT",
  //   href: "https://www.flynncenter.org",
  // },
    {
    date: "2026-06-20",
    title: "Vermont Jazz Ensemble",
    venue: "Lost Nation Brewing",
    location: "Morristown, VT",
    href: "https://sevendaystickets.com/e/vermont-jazz-ensemble",
  },
    {
    date: "2026-04-25",
    title: "Vermont Jazz Ensemble's 50th Anniverary Show",
    venue: "Higher Ground",
    location: "South Burlington, VT",
    href: "https://highergroundmusic.com/events/vermont-jazz-ensemble/",
  },
];
