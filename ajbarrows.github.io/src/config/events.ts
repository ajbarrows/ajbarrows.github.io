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
      date: "2026-11-15",
      title: "Montpelier Chamber Orchestra",
      venue: "Lost Nation Theater",
      location: "Montpelier, VT",
      href: "https://www.mcovt.org"
    },
    {
      date: "2026-09-26",
      title: "Vermont Symphonic Winds",
      venue: "Elley Long Music Center",
      location: "Colchester, VT",
      href: "https://www.vermontpublic.org/show/classical-music-with-helen-lyons/2026-09-18/the-vermont-symphonic-winds-enter-a-new-era-with-their-2026-2027-season"
      
    },
    {
      date: "2026-08-16",
      title: "Vermont Jazz Ensemble",
      venue: "Island Arts",
      location: "North Hero, VT",
      href: "https://www.islandarts.org"
    },
    {
      date: "2026-07-25",
      title: "Vermont Jazz Ensemble",
      venue: "Maple Roots Festival",
      location: "East Montpelier, VT",
      href: "https://www.maplerootsfest.com/2026-artists"
    },
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
